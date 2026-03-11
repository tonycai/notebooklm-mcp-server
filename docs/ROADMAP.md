# Project Roadmap: notebooklm-mcp-server

The mission of `notebooklm-mcp-server` is to provide the most robust, Node.js-native bridge to Google NotebookLM, enabling seamless integration with any MCP-compatible environment.

## Phase 1: Foundation & Stability (Completed)
- [x] Reverse-engineer core `batchexecute` RPC protocol
- [x] Implement tools: `notebook_list`, `notebook_create`, `notebook_delete`, `notebook_rename`
- [x] Implement Playwright-based browser authentication
- [x] Auto-recovery with cookie reload on 401/403/RPC error 16 (up to 2 retries)
- [x] CSRF token and session ID extraction from main page HTML
- [x] Bundle with esbuild to resolve CJS/ESM interop issues

## Phase 2: Source Management (Completed)
- [x] YouTube URL ingestion (`notebook_add_url` with auto-detection)
- [x] Website URL ingestion
- [x] Local file uploads: PDF (via pdf-parse), Markdown, Text (`notebook_add_local_file`)
- [x] Google Drive source integration: Docs, Slides, Sheets, PDF (`notebook_add_drive`)
- [x] Source deletion (`source_delete`)
- [x] Drive source sync (`source_sync`)
- [x] Pasted text as source (`notebook_add_text`)

## Phase 3: Advanced Interaction (Completed)
- [x] Streaming query responses via `GenerateFreeFormStreamed` endpoint
- [x] Auto-fetch source IDs from notebook when not provided
- [x] Conversation continuity via `conversation_id`
- [x] Chat configuration: goal mode (default, learning guide, custom) and response length
- [x] Research mode: fast (~30s, web/drive) and deep (~5min, web only)
- [x] Research polling and source import
- [x] Mind map generation, saving, listing, and deletion

## Phase 4: Studio Content Generation (Completed)
- [x] Audio Overview (podcast) generation
- [x] Video Overview generation
- [x] Written report generation
- [x] Flashcard generation
- [x] Infographic generation
- [x] Slide deck generation
- [x] Data table generation
- [x] Studio artifact polling and deletion

## Phase 5: Developer & User Experience (Completed)
- [x] Published to npmjs.com as `notebooklm-mcp-server`
- [x] Auto-update checker with platform-specific handling (Unix + Windows)
- [x] Docker support with multi-stage build (117MB image, no Chromium)
- [x] Docker Compose for easy deployment
- [x] Multi-language documentation (EN, ES, FR, PT, DE) with sync checker
- [x] Claude Code skill integration
- [x] Gemini CLI integration
- [x] VS Code (Cline, MCP Client) and Antigravity integration guides

## Phase 6: Security Hardening (Completed)
- [x] Path traversal protection for local file uploads
- [x] Restrictive file permissions (0600/0700) for credential storage
- [x] Input validation for all 28 tool handlers
- [x] Error sanitization to prevent cookie/header leakage
- [x] Command injection prevention in Windows auto-updater

## Future
- [ ] Unit and integration test suite
- [ ] Streaming responses to MCP client (when SDK supports it)
- [ ] Multi-account support (switching between Google profiles)
- [ ] Web-based dashboard for server status and cookie management
- [ ] Plugin system for custom post-processing of AI answers

---
*Note: This roadmap is subject to change based on updates to Google's internal APIs.*
