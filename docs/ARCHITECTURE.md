# System Architecture

The `notebooklm-mcp-server` is a lightweight bridge between the Model Context Protocol (MCP) and Google NotebookLM's internal RPC system. Built natively in TypeScript.

## Core Components

### 1. MCP Server Layer (`src/server.ts`)
Handles communication with MCP clients via stdio using `@modelcontextprotocol/sdk`:
- **Tool Discovery**: Exposes 28 tools across 6 categories (notebooks, sources, research, studio, mind maps, system).
- **Input Validation**: All tool arguments are validated with type-safe helpers (`requireString`, `requireBoolean`, `optionalStringArray`) before dispatch.
- **Error Sanitization**: Axios errors are sanitized via `sanitizeError()` to prevent cookie/header leakage in responses.

### 2. NotebookLM API Client (`src/client.ts`)
Since Google does not provide a public API for NotebookLM, this client performs reverse-engineered RPC calls using `axios`:
- **BatchExecute**: Implements Google's `batchexecute` protocol, posting to `/_/LabsTailwindUi/data/batchexecute`.
- **RPC IDs**: Uses specific 6-character IDs (e.g., `wXbhsf` for list, `CCqFvf` for create) defined in `src/constants.ts`.
- **Streaming Query**: Uses a separate streaming endpoint (`GenerateFreeFormStreamed`) for notebook queries.
- **Response Parser**: Strips anti-XSSI prefix (`)]}'`), parses chunked responses, and extracts results by RPC ID.
- **Auto-Recovery**: On 401/403 or RPC error 16, reloads cookies from disk and retries up to 2 times.

### 3. Authentication & Session Manager (`src/auth.ts`)
Maintains the bridge to the user's Google account:
- **Browser Login**: Uses Playwright to launch Chromium for interactive Google login.
- **Cookie Extraction**: Extracts cookies scoped to `notebooklm.google.com`, deduplicates by name, and validates required session cookies (`SID`, `HSID`, `SSID`, `APISID`, `SAPISID`).
- **Secure Storage**: Cookies saved to `~/.notebooklm-mcp/auth.json` with `0600` permissions in a `0700` directory.
- **CSRF Token**: Extracted from `"SNlM0e"` in the main page HTML on first API call.
- **Cookie Provider**: Server sets a cookie provider function so the client can auto-reload from disk on auth failure.

### 4. CLI Entry Point (`src/index.ts`)
Uses `commander` to provide two subcommands:
- `server` (default): Starts the MCP server over stdio.
- `auth`: Runs interactive browser authentication.

### 5. Auto-Updater (`src/update.ts`)
Checks npm registry for new versions at startup:
- Unix: Updates in-process via `npm install -g` and relaunches.
- Windows: Spawns a detached batch script to handle locked files, with shell metacharacter validation to prevent command injection.

## Data Flow

```
MCP Client ──stdio──► server.ts ──validates──► client.ts ──HTTPS──► notebooklm.google.com
                         │                        │
                    input validation          batchexecute RPC
                    error sanitization        CSRF token mgmt
                                             cookie auto-reload
                                             response parsing
```

1. **Request**: MCP client sends a tool execution request via stdio.
2. **Validation**: Server validates all required parameters with type-safe helpers.
3. **Init**: Client lazy-initializes by fetching the CSRF token from the main page (if not already done).
4. **RPC**: Client builds a `batchexecute` payload and POSTs to Google's endpoint.
5. **Parse**: Response is stripped of anti-XSSI prefix, parsed from chunked format, and result extracted by RPC ID.
6. **Sanitize**: Any errors are sanitized (stripping headers/cookies) before returning to the MCP client.

## Security Measures

- **Path Traversal Protection**: `uploadLocalFile` restricts paths to the current working directory.
- **Credential Permissions**: `auth.json` stored with `0600`, directory with `0700`.
- **Input Validation**: All 28 tool handlers validate required parameters before processing.
- **Error Sanitization**: Axios errors never expose request config (headers, cookies) to the MCP client.
- **Command Injection Prevention**: Windows updater rejects arguments with shell metacharacters.
- **Transport**: All Google API communication enforced over HTTPS.
