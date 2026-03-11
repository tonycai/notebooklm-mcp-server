<p align="center">
  <img src="./notebooklm_mcp_logo.png" width="200" alt="Notebook-mcp-server Logo">
</p>

<h1 align="center">NotebookLM MCP Server</h1>

<p align="center">
  <b>Let your AI agents chat directly with Google NotebookLM for zero-hallucination answers.</b>
</p>

<p align="center">
  <b>English</b> • 
  <a href="README.es.md">Español</a> • 
  <a href="README.fr.md">Français</a> • 
  <a href="README.pt.md">Português</a> • 
  <a href="README.de.md">Deutsch</a>
</p>

<p align="center">
  <a href="https://www.typescriptlang.org/"><img src="https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white" alt="TypeScript"></a>
  <a href="https://modelcontextprotocol.io"><img src="https://img.shields.io/badge/MCP-Model%20Context%20Protocol-orange?style=for-the-badge" alt="MCP"></a>
  <a href="https://www.npmjs.com/package/notebooklm-mcp-server"><img src="https://img.shields.io/badge/NPM-CB3837?style=for-the-badge&logo=npm&logoColor=white" alt="NPM"></a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Windows-0078D4?style=for-the-badge&logo=windows&logoColor=white" alt="Windows">
  <img src="https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=white" alt="macOS">
  <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" alt="Linux">
</p>

<p align="center">
  <a href="https://anthropic.com"><img src="https://img.shields.io/badge/Claude%20Code-Skill-blueviolet?style=for-the-badge" alt="Claude Code"></a>
  <a href="https://geminicli.com/"><img src="https://img.shields.io/badge/Gemini%20CLI-Skill-blueviolet?style=for-the-badge" alt="Gemini CLI"></a>
  <img src="https://img.shields.io/badge/Cursor-000000?style=for-the-badge&logo=cursor&logoColor=white" alt="Cursor">
  <img src="https://img.shields.io/badge/Windsurf-00AEEF?style=for-the-badge" alt="Windsurf">
  <img src="https://img.shields.io/badge/Cline-FF5733?style=for-the-badge" alt="Cline">
</p>

<p align="center">
  <a href="#installation">Installation</a> •
  <a href="#authentication">Authentication</a> •
  <a href="#quick-start">Quick Start</a> •
  <a href="#-docker-deployment">Docker</a> •
  <a href="#documentation">Documentation</a> •
  <a href="#architecture">Architecture</a> •
  <a href="#development">Development</a>
</p>

## The Solution

The **NotebookLM MCP Server** brings the power of Google's NotebookLM directly into your AI-augmented workflow. Built natively in **TypeScript** using the Model Context Protocol, it allows agents to read, search, and manage your notebooks as if they were local files.

---

## 🚀 Installation

### 1. Global Installation (Recommended)

You can install the server directly from NPM:

```bash
npm install -g notebooklm-mcp-server
```

> [!NOTE]
> **Auto-update**: The server automatically checks for new versions at startup. If an update exists, it will install itself and ask you to restart to ensure you always have the latest Google fixes.

### 2. Direct usage with NPX (Zero-Config)

If you don't want to install it globally, you can run it directly:

```bash
npx notebooklm-mcp-server auth   # To log in
npx notebooklm-mcp-server start  # To run the server
```

---

## 🔑 Authentication

Before using the server, you must link it to your Google Account. This version uses a secure, persistent browser session:

1. Run the authentication command:
   ```bash
   npx notebooklm-mcp-server auth
   ```
2. A browser window will open. Log in with your Google account.
3. Close the browser once you see your notebooks. Your session is now securely saved locally.

> [!TIP]
> **Session Expired?** If your agent receives authentication errors, simply ask it to run the command `npx notebooklm-mcp-server refresh_auth`. It will automatically open the browser for you to renew the session without leaving your chat.

---

## ⚡ Quick Start

### 🤖 Claude Desktop

Add the following to your `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "notebooklm": {
      "command": "npx",
      "args": ["-y", "notebooklm-mcp-server", "start"]
    }
  }
}
```

### 💻 Visual Studio Code

Since VS Code does not support MCP natively yet, you must use an extension:

#### Option A: Using [Cline](https://marketplace.visualstudio.com/items?itemName=saoudrizwan.claude-dev) (Recommended)

1. Open **Cline Settings** in VS Code.
2. Scroll to the **MCP Servers** section.
3. Click **Add New MCP Server**.
4. Use the following configuration:
   - **Name**: `notebooklm`
   - **Command**: `npx -y notebooklm-mcp-server start`

#### Option B: Using [MCP Client](https://marketplace.visualstudio.com/items?itemName=stefan-mcp.mcp-client)

1. Install the extension from the Marketplace.
2. Open your VS Code `settings.json`.
3. Add the server under `mcp.servers`:
   ```json
   "mcp.servers": {
     "notebooklm": {
       "command": "npx",
       "args": ["-y", "notebooklm-mcp-server", "start"]
     }
   }
   ```

### 🌌 Antigravity

Antigravity supports MCP natively. You can add the server by editing your global configuration file:

1. **Locate your `mcp.json`**:
   - **Windows**: `%APPDATA%\antigravity\mcp.json`
   - **macOS**: `~/Library/Application Support/antigravity/mcp.json`
   - **Linux**: `~/.config/antigravity/mcp.json`

2. **Add the server** to the `mcpServers` object:

```json
{
  "mcpServers": {
    "notebooklm": {
      "command": "npx",
      "args": ["-y", "notebooklm-mcp-server", "start"]
    }
  }
}
```

3. **Restart Antigravity**: The new tools will appear in your sidebar instantly.

---

### 💎 Gemini CLI

Run the following command in your terminal to add the notebooklm skill:

```bash
gemini mcp add notebooklm --scope user -- npx -y notebooklm-mcp-server start
```

---

## 🤖 Claude Code Skill

Add it instantly to Claude Code:

```bash
claude skill add notebooklm -- "npx -y notebooklm-mcp-server start"
```

---

## 📖 Documentation

### 28 Tools Available

<details>
<summary><b>📒 Notebook Management</b> (4 tools)</summary>

| Tool               | Description                                           |
| :----------------- | :---------------------------------------------------- |
| `notebook_list`    | Lists all notebooks with sources and metadata.        |
| `notebook_create`  | Creates a new notebook with a title.                  |
| `notebook_rename`  | Renames an existing notebook.                         |
| `notebook_delete`  | Deletes a notebook permanently (**irreversible**).    |

</details>

<details>
<summary><b>🖇️ Source Management</b> (6 tools)</summary>

| Tool                     | Description                                            |
| :----------------------- | :----------------------------------------------------- |
| `notebook_add_url`        | Adds a website or YouTube video as a source.           |
| `notebook_add_text`       | Adds custom text content as a source.                  |
| `notebook_add_local_file` | Uploads a local PDF, Markdown, or Text file.           |
| `notebook_add_drive`      | Adds a Google Drive file (Docs, Slides, Sheets, PDF).  |
| `source_delete`           | Removes a source permanently (**irreversible**).       |
| `source_sync`             | Syncs a Drive source to get the latest version.        |

</details>

<details>
<summary><b>🔍 Research & Query</b> (5 tools)</summary>

| Tool               | Description                                           |
| :----------------- | :---------------------------------------------------- |
| `notebook_query`   | Ask AI about existing sources in a notebook.          |
| `chat_configure`   | Configure chat goal (default, learning guide, custom) and response length. |
| `research_start`   | Start web or Drive research (`fast` ~30s or `deep` ~5min). |
| `research_poll`    | Poll for research status and discovered sources.      |
| `research_import`  | Import discovered sources into the notebook.          |

</details>

<details>
<summary><b>🎨 Studio & Generation</b> (9 tools)</summary>

| Tool                    | Description                                           |
| :---------------------- | :---------------------------------------------------- |
| `audio_overview_create` | Generate an Audio Overview (podcast).                 |
| `video_overview_create` | Generate a Video Overview.                            |
| `report_create`         | Generate a written report from sources.               |
| `flashcards_create`     | Generate flashcards from sources.                     |
| `infographic_create`    | Generate an infographic from sources.                 |
| `slide_deck_create`     | Generate a slide deck from sources.                   |
| `data_table_create`     | Generate a data table from sources.                   |
| `studio_poll`           | Check status of all studio artifacts.                 |
| `studio_delete`         | Delete a studio artifact.                             |

</details>

<details>
<summary><b>🧠 Mind Maps</b> (4 tools)</summary>

| Tool                | Description                                          |
| :------------------ | :--------------------------------------------------- |
| `mind_map_generate` | Generate a Mind Map JSON from sources.               |
| `mind_map_save`     | Save a generated mind map to the notebook.           |
| `mind_map_list`     | List all mind maps in a notebook.                    |
| `mind_map_delete`   | Delete a mind map from a notebook.                   |

</details>

<details>
<summary><b>⚙️ System</b> (1 tool)</summary>

| Tool           | Description                                                        |
| :------------- | :----------------------------------------------------------------- |
| `refresh_auth` | Reload cookies from disk. Run `notebooklm-mcp-server auth` first if expired. |

</details>

> For full parameter details, see [docs/TOOLS.md](docs/TOOLS.md).

---

## 💡 Usage Examples

These examples show what you can ask your AI agent once the server is connected.

### Basic Workflow — Create, Add Sources, and Query

```
"Create a notebook called 'Rust Research' and add these sources:
 - https://doc.rust-lang.org/book/
 - https://www.youtube.com/watch?v=OX9HJsJUDxA
Then ask it: What are the key differences between ownership and borrowing?"
```

### Upload Local Files

```
"Add my notes from ./notes/architecture.md and ./docs/spec.pdf
to the 'Project Design' notebook, then summarize the key decisions."
```

### Web Research

```
"In my 'AI Safety' notebook, start a deep web research for
'latest developments in AI alignment 2026' and import the
top results as sources."
```

### Generate Studio Content

```
"Generate a podcast-style audio overview of my 'Quarterly Report' notebook,
focused on revenue trends, in English."
```

```
"Create flashcards from my 'Biology 101' notebook for the
sources about cell division."
```

### Mind Maps

```
"Generate a mind map from all sources in my 'Product Strategy' notebook,
then save it with the title 'Q2 Roadmap Overview'."
```

### Multi-step Agent Workflow

```
"1. List all my notebooks
 2. In the 'Machine Learning' notebook, research 'transformer architectures 2026'
 3. Wait for results, then import the top 5 sources
 4. Query the notebook: 'Compare attention mechanisms across the imported papers'
 5. Generate a report with the findings"
```

---

## 🐳 Docker Deployment

Run the server in a container for isolated, reproducible deployments.

### Prerequisites

Authenticate on the host first (requires a browser):

```bash
npx notebooklm-mcp-server auth
```

### Build and Run

```bash
docker compose build
docker compose up -d
```

Or run interactively:

```bash
docker compose run --rm notebooklm-mcp-server
```

The `docker-compose.yml` mounts `~/.notebooklm-mcp` read-only into the container so it can access your saved session cookies. Alternatively, pass cookies directly via the `NOTEBOOKLM_COOKIES` environment variable.

> [!NOTE]
> The Docker image uses a multi-stage build with `node:20-slim` and skips the Playwright/Chromium download, resulting in a ~117MB image. Authentication must be done on the host since it requires a browser.

---

## 🏗️ Architecture

```
┌─────────────────┐     stdio      ┌──────────────────────────┐
│   MCP Client    │◄──────────────►│   MCP Server (server.ts) │
│ (Claude, Cursor │                │   - Tool definitions     │
│  Cline, etc.)   │                │   - Input validation     │
└─────────────────┘                │   - Error sanitization   │
                                   └────────────┬─────────────┘
                                                │
                                   ┌────────────▼─────────────┐
                                   │  NotebookLMClient        │
                                   │  (client.ts)             │
                                   │   - batchexecute RPC     │
                                   │   - CSRF token mgmt      │
                                   │   - Cookie auto-reload   │
                                   │   - Response parsing     │
                                   └────────────┬─────────────┘
                                                │ HTTPS
                                   ┌────────────▼─────────────┐
                                   │  Google NotebookLM       │
                                   │  (notebooklm.google.com) │
                                   └──────────────────────────┘
```

### Core Components

| File | Purpose |
|------|---------|
| `src/server.ts` | MCP server — registers 28 tools, validates inputs, dispatches to client |
| `src/client.ts` | NotebookLM API client — batchexecute RPC, response parsing, query streaming |
| `src/auth.ts` | Playwright-based browser authentication, cookie extraction and storage |
| `src/constants.ts` | RPC IDs, API endpoints, build label, timeouts |
| `src/update.ts` | Auto-update checker with platform-specific handling |
| `src/index.ts` | CLI entry point (commander) — `server` and `auth` subcommands |

### How It Works

Since Google does not provide a public API for NotebookLM, this server uses **reverse-engineered RPC calls**:

1. **Authentication**: Playwright opens a real browser for Google login; session cookies are saved to `~/.notebooklm-mcp/auth.json` with restrictive file permissions (`0600`)
2. **CSRF Token**: On first API call, fetches the main page HTML and extracts the `SNlM0e` CSRF token and `FdrFJe` session ID
3. **RPC Calls**: Constructs `batchexecute` payloads with specific RPC IDs (e.g., `wXbhsf` for list notebooks) and POSTs to `/_/LabsTailwindUi/data/batchexecute`
4. **Response Parsing**: Strips the anti-XSSI prefix (`)]}'`), parses the chunked response format, and extracts results by RPC ID
5. **Query Streaming**: Uses a separate streaming endpoint for notebook queries, extracting the longest answer from chunked responses
6. **Auto-Recovery**: On auth failure (401/403 or RPC error 16), automatically reloads cookies from disk and retries up to 2 times

---

## 🔒 Security

- **Path Traversal Protection**: Local file uploads are restricted to the current working directory
- **Credential Storage**: Auth cookies are saved with `0600` permissions (owner read/write only) in a `0700` directory
- **Input Validation**: All 28 tool handlers validate required parameters before processing
- **Error Sanitization**: Axios errors are sanitized to prevent cookie/header leakage in MCP responses
- **Command Injection Prevention**: Windows auto-updater rejects arguments containing shell metacharacters
- **HTTPS Only**: All communication with Google NotebookLM is over HTTPS

---

## 🛠️ Development

### Build from Source

```bash
git clone https://github.com/tonycai/notebooklm-mcp-server.git
cd notebooklm-mcp-server
npm install
npm run build
```

### Available Scripts

| Script | Description |
|--------|-------------|
| `npm run build` | Bundle with esbuild to `dist/` |
| `npm run typecheck` | TypeScript type checking (no emit) |
| `npm run auth` | Run interactive authentication |
| `npm start` | Start the server from `dist/` |
| `npm run docs:check` | Verify translations are in sync |

### Project Structure

```
src/
├── index.ts        # CLI entry point
├── server.ts       # MCP server + 28 tool handlers
├── client.ts       # NotebookLM API client (~1475 lines)
├── auth.ts         # Playwright browser authentication
├── auth-cli.ts     # Auth CLI with progress UI
├── constants.ts    # RPC IDs, endpoints, timeouts
└── update.ts       # Auto-update checker
```

---

## 🌐 Localization

This project is available in multiple languages:
- [English](README.md) (Source)
- [Español](README.es.md)
- [Français](README.fr.md)
- [Português](README.pt.md)
- [Deutsch](README.de.md)

If you update the English `README.md`, please ensure the translations are updated accordingly to keep the documentation synchronized.

## 📄 License

MIT License. Developed with ❤️ by [moodRobotics](https://github.com/moodRobotics).
