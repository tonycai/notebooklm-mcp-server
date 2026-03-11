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
  <a href="#quick-start-claude-desktop">Quick Start</a> • 
  <a href="#claude-code-skill">Claude Code</a> • 
  <a href="#documentation">Documentation</a> •
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

## 🛠️ Development

To contribute or build from source:

```bash
git clone https://github.com/moodRobotics/notebook-mcp-server.git
npm install
npm run build
```

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
