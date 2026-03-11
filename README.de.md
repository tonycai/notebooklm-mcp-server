<p align="center">
  <img src="./notebooklm_mcp_logo.png" width="200" alt="Notebook-mcp-server Logo">
</p>

<h1 align="center">NotebookLM MCP-Server</h1>

<p align="center">
  <b>Lassen Sie Ihre KI-Agenten direkt mit Google NotebookLM chatten, um Antworten ohne Halluzinationen zu erhalten.</b>
</p>

<p align="center">
  <a href="README.md">English</a> • 
  <a href="README.es.md">Español</a> • 
  <a href="README.fr.md">Français</a> • 
  <a href="README.pt.md">Português</a> • 
  <b>Deutsch</b>
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
  <a href="#authentifizierung">Authentifizierung</a> • 
  <a href="#schnellstart-claude-desktop">Schnellstart</a> • 
  <a href="#claude-code-skill">Claude Code</a> • 
  <a href="#dokumentation">Dokumentation</a> •
  <a href="#entwicklung">Entwicklung</a>
</p>

## Die Lösung

Der **NotebookLM MCP-Server** bringt die Leistungsfähigkeit von Google NotebookLM direkt in Ihren KI-unterstützten Arbeitsablauf. Nativ in **TypeScript** unter Verwendung des Model Context Protocols entwickelt, ermöglicht er KI-Agenten das Lesen, Suchen und Verwalten Ihrer Notebooks so, als wären es lokale Dateien.

---

## 🚀 Installation

### 1. Globale Installation (Empfohlen)

Sie können den Server direkt über NPM installieren:

```bash
npm install -g notebooklm-mcp-server
```

> [!NOTE]
> **Auto-Update**: Der Server prüft beim Start automatisch auf neue Versionen. Wenn ein Update verfügbar ist, installiert er sich selbst und bittet Sie um einen Neustart, um sicherzustellen, dass Sie immer die neuesten Google-Fixes haben.

### 2. Direkte Verwendung mit NPX (Zero-Config)

Wenn Sie den Server nicht global installieren möchten, können Sie ihn direkt ausführen:

```bash
npx notebooklm-mcp-server auth   # Zur Anmeldung
npx notebooklm-mcp-server start  # Zum Starten des Servers
```

---

## 🔑 Authentifizierung

Bevor Sie den Server verwenden können, müssen Sie ihn mit Ihrem Google-Konto verknüpfen. Diese Version verwendet eine sichere, persistente Browsersitzung:

1. Führen Sie den Authentifizierungsbefehl aus:
   ```bash
   npx notebooklm-mcp-server auth
   ```
2. Ein Browserfenster öffnet sich. Melden Sie sich mit Ihrem Google-Konto an.
3. Schließen Sie den Browser, sobald Sie Ihre Notebooks sehen. Ihre Sitzung ist nun lokal sicher gespeichert.

> [!TIP]
> **Sitzung abgelaufen?** Wenn Ihr Agent Authentifizierungsfehler erhält, bitten Sie ihn einfach, den Befehl `npx notebooklm-mcp-server refresh_auth` auszuführen. Er öffnet automatisch den Browser, damit Sie die Sitzung erneuern können, ohne den Chat verlassen zu müssen.

---

## ⚡ Schnellstart

### 🤖 Claude Desktop

Fügen Sie Folgendes zu Ihrer `claude_desktop_config.json` hinzu:

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

Da VS Code MCP noch nicht nativ unterstützt, müssen Sie eine Erweiterung verwenden:

#### Option A: Verwendung von [Cline](https://marketplace.visualstudio.com/items?itemName=saoudrizwan.claude-dev) (Empfohlen)

1. Öffnen Sie die **Cline-Einstellungen** in VS Code.
2. Scrollen Sie zum Abschnitt **MCP-Server**.
3. Klicken Sie auf **Add New MCP Server**.
4. Verwenden Sie die folgende Konfiguration:
   - **Name**: `notebooklm`
   - **Befehl**: `npx -y notebooklm-mcp-server start`

#### Option B: Verwendung von [MCP Client](https://marketplace.visualstudio.com/items?itemName=stefan-mcp.mcp-client)

1. Installieren Sie die Erweiterung aus dem Marketplace.
2. Öffnen Sie Ihre VS Code `settings.json`.
3. Fügen Sie den Server unter `mcp.servers` hinzu:
   ```json
   "mcp.servers": {
     "notebooklm": {
       "command": "npx",
       "args": ["-y", "notebooklm-mcp-server", "start"]
     }
   }
   ```

### 🌌 Antigravity

Antigravity unterstützt MCP nativ. Sie können den Server hinzufügen, indem Sie Ihre globale Konfigurationsdatei bearbeiten:

1. **Suchen Sie Ihre `mcp.json`**:
   - **Windows**: `%APPDATA%\antigravity\mcp.json`
   - **macOS**: `~/Library/Application Support/antigravity/mcp.json`
   - **Linux**: `~/.config/antigravity/mcp.json`

2. **Fügen Sie den Server** zum `mcpServers`-Objekt hinzu:

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

3. **Starten Sie Antigravity neu**: Die neuen Tools erscheinen sofort in Ihrer Seitenleiste.

---

### 💎 Gemini CLI

Führen Sie den folgenden Befehl in Ihrem Terminal aus, um den notebooklm-Skill hinzuzufügen:

```bash
gemini mcp add notebooklm --scope user -- npx -y notebooklm-mcp-server start
```

---

## 🤖 Claude Code Skill

Fügen Sie ihn sofort zu Claude Code hinzu:

```bash
claude skill add notebooklm -- "npx -y notebooklm-mcp-server start"
```

---

## 📖 Dokumentation

### 28 verfügbare Tools

<details>
<summary><b>📒 Notebook-Verwaltung</b> (4 Tools)</summary>

| Tool               | Beschreibung                                           |
| :----------------- | :----------------------------------------------------- |
| `notebook_list`    | Listet alle Notebooks mit Quellen und Metadaten auf.  |
| `notebook_create`  | Erstellt ein neues Notebook mit einem Titel.          |
| `notebook_rename`  | Benennt ein vorhandenes Notebook um.                  |
| `notebook_delete`  | Löscht ein Notebook dauerhaft (**irreversibel**).     |

</details>

<details>
<summary><b>🖇️ Quellen-Verwaltung</b> (6 Tools)</summary>

| Tool                      | Beschreibung                                           |
| :------------------------ | :----------------------------------------------------- |
| `notebook_add_url`        | Fügt eine Website oder ein YouTube-Video als Quelle hinzu. |
| `notebook_add_text`       | Fügt benutzerdefinierten Textinhalt als Quelle hinzu. |
| `notebook_add_local_file` | Lädt eine lokale PDF-, Markdown- oder Textdatei hoch. |
| `notebook_add_drive`      | Fügt eine Google-Drive-Datei hinzu (Docs, Slides, Sheets, PDF). |
| `source_delete`           | Entfernt eine Quelle dauerhaft (**irreversibel**).    |
| `source_sync`             | Synchronisiert eine Drive-Quelle für die neueste Version. |

</details>

<details>
<summary><b>🔍 Recherche & Abfrage</b> (5 Tools)</summary>

| Tool               | Beschreibung                                           |
| :----------------- | :----------------------------------------------------- |
| `notebook_query`   | Fragt die KI zu vorhandenen Quellen eines Notebooks.  |
| `chat_configure`   | Konfiguriert das Chat-Ziel (Standard, Lernbegleiter, benutzerdefiniert) und die Antwortlänge. |
| `research_start`   | Startet Web- oder Drive-Recherche (`fast` ~30s oder `deep` ~5min). |
| `research_poll`    | Fragt Status und entdeckte Quellen ab.                |
| `research_import`  | Importiert entdeckte Quellen ins Notebook.            |

</details>

<details>
<summary><b>🎨 Studio & Generierung</b> (9 Tools)</summary>

| Tool                    | Beschreibung                                           |
| :---------------------- | :----------------------------------------------------- |
| `audio_overview_create` | Generiert eine Audio-Übersicht (Podcast).             |
| `video_overview_create` | Generiert eine Video-Übersicht.                       |
| `report_create`         | Generiert einen schriftlichen Bericht aus Quellen.    |
| `flashcards_create`     | Generiert Karteikarten aus Quellen.                   |
| `infographic_create`    | Generiert eine Infografik aus Quellen.                |
| `slide_deck_create`     | Generiert eine Folienpräsentation aus Quellen.        |
| `data_table_create`     | Generiert eine Datentabelle aus Quellen.              |
| `studio_poll`           | Prüft den Status aller Studio-Artefakte.              |
| `studio_delete`         | Löscht ein Studio-Artefakt.                           |

</details>

<details>
<summary><b>🧠 Mind Maps</b> (4 Tools)</summary>

| Tool                | Beschreibung                                          |
| :------------------ | :---------------------------------------------------- |
| `mind_map_generate` | Generiert eine Mind-Map-JSON aus Quellen.             |
| `mind_map_save`     | Speichert eine generierte Mind Map im Notebook.       |
| `mind_map_list`     | Listet alle Mind Maps eines Notebooks auf.            |
| `mind_map_delete`   | Löscht eine Mind Map aus einem Notebook.              |

</details>

<details>
<summary><b>⚙️ System</b> (1 Tool)</summary>

| Tool           | Beschreibung                                                        |
| :------------- | :------------------------------------------------------------------ |
| `refresh_auth` | Lädt Cookies von der Festplatte neu. Führen Sie zuerst `notebooklm-mcp-server auth` aus, wenn sie abgelaufen sind. |

</details>

> Für vollständige Parameterdetails siehe [docs/TOOLS.md](docs/TOOLS.md).

---

## 💡 Verwendungsbeispiele

Diese Beispiele zeigen, was Sie Ihren KI-Agenten fragen können, sobald der Server verbunden ist.

### Grundlegender Ablauf — Erstellen, Quellen hinzufügen und Abfragen

```
"Erstelle ein Notebook namens 'Rust-Recherche' und füge diese Quellen hinzu:
 - https://doc.rust-lang.org/book/
 - https://www.youtube.com/watch?v=OX9HJsJUDxA
Dann frage: Was sind die Hauptunterschiede zwischen Ownership und Borrowing?"
```

### Lokale Dateien hochladen

```
"Füge meine Notizen aus ./notes/architektur.md und ./docs/spec.pdf
zum Notebook 'Projektdesign' hinzu und fasse dann die wichtigsten Entscheidungen zusammen."
```

### Web-Recherche

```
"In meinem Notebook 'KI-Sicherheit', starte eine tiefe Web-Recherche über
'neueste Entwicklungen im KI-Alignment 2026' und importiere die
besten Ergebnisse als Quellen."
```

### Studio-Inhalte generieren

```
"Generiere eine Podcast-Audio-Übersicht meines Notebooks 'Quartalsbericht',
mit Fokus auf Umsatztrends, auf Deutsch."
```

```
"Erstelle Karteikarten aus meinem Notebook 'Biologie 101' für die
Quellen zur Zellteilung."
```

### Mind Maps

```
"Generiere eine Mind Map aus allen Quellen meines Notebooks 'Produktstrategie',
dann speichere sie mit dem Titel 'Q2-Roadmap-Übersicht'."
```

### Mehrstufiger Agenten-Workflow

```
"1. Liste alle meine Notebooks auf
 2. Im Notebook 'Machine Learning', recherchiere 'Transformer-Architekturen 2026'
 3. Warte auf die Ergebnisse, dann importiere die 5 besten Quellen
 4. Frage das Notebook: 'Vergleiche die Aufmerksamkeitsmechanismen der importierten Papers'
 5. Generiere einen Bericht mit den Ergebnissen"
```

---

## 🐳 Docker-Bereitstellung

Führen Sie den Server in einem Container für isolierte, reproduzierbare Bereitstellungen aus.

### Voraussetzungen

Authentifizieren Sie sich zuerst auf dem Host (erfordert einen Browser):

```bash
npx notebooklm-mcp-server auth
```

### Erstellen und Ausführen

```bash
docker compose build
docker compose up -d
```

Oder interaktiv ausführen:

```bash
docker compose run --rm notebooklm-mcp-server
```

Die `docker-compose.yml` mountet `~/.notebooklm-mcp` schreibgeschützt in den Container, um auf gespeicherte Sitzungs-Cookies zuzugreifen. Alternativ können Cookies über die Umgebungsvariable `NOTEBOOKLM_COOKIES` übergeben werden.

> [!NOTE]
> Das Docker-Image verwendet einen Multi-Stage-Build mit `node:20-slim` und überspringt den Playwright/Chromium-Download, was zu einem ~117MB Image führt. Die Authentifizierung muss auf dem Host erfolgen, da sie einen Browser erfordert.

---

## 🏗️ Architektur

```
┌─────────────────┐     stdio      ┌──────────────────────────┐
│   MCP-Client    │◄──────────────►│   MCP-Server             │
│ (Claude, Cursor │                │   (server.ts)            │
│  Cline, etc.)   │                │   - Tool-Definitionen    │
└─────────────────┘                │   - Eingabevalidierung   │
                                   └────────────┬─────────────┘
                                                │
                                   ┌────────────▼─────────────┐
                                   │  NotebookLMClient        │
                                   │  (client.ts)             │
                                   │   - RPC batchexecute     │
                                   │   - CSRF-Verwaltung      │
                                   │   - Cookie-Neuladen      │
                                   └────────────┬─────────────┘
                                                │ HTTPS
                                   ┌────────────▼─────────────┐
                                   │  Google NotebookLM       │
                                   │  (notebooklm.google.com) │
                                   └──────────────────────────┘
```

### Hauptkomponenten

| Datei | Zweck |
|-------|-------|
| `src/server.ts` | MCP-Server — registriert 28 Tools, validiert Eingaben, leitet an den Client weiter |
| `src/client.ts` | NotebookLM API-Client — batchexecute RPC, Antwort-Parsing, Query-Streaming |
| `src/auth.ts` | Playwright-basierte Browser-Authentifizierung, Cookie-Extraktion und -Speicherung |
| `src/constants.ts` | RPC-IDs, Endpoints, Build-Label, Timeouts |
| `src/update.ts` | Automatischer Update-Checker |
| `src/index.ts` | CLI-Einstiegspunkt (commander) — Unterbefehle `server` und `auth` |

---

## 🔒 Sicherheit

- **Path-Traversal-Schutz**: Lokale Datei-Uploads sind auf das aktuelle Arbeitsverzeichnis beschränkt
- **Anmeldedaten-Speicherung**: Cookies mit `0600`-Berechtigungen (nur Eigentümer lesen/schreiben) in einem `0700`-Verzeichnis gespeichert
- **Eingabevalidierung**: Alle 28 Tool-Handler validieren erforderliche Parameter vor der Verarbeitung
- **Fehlerbereinigung**: Axios-Fehler werden bereinigt, um Cookie-/Header-Lecks in MCP-Antworten zu verhindern
- **Command-Injection-Prävention**: Der Windows-Updater lehnt Argumente mit Shell-Metazeichen ab
- **Nur HTTPS**: Gesamte Kommunikation mit Google NotebookLM über HTTPS

---

## 🛠️ Entwicklung

### Aus dem Quellcode erstellen

```bash
git clone https://github.com/tonycai/notebooklm-mcp-server.git
cd notebooklm-mcp-server
npm install
npm run build
```

### Verfügbare Skripte

| Skript | Beschreibung |
|--------|-------------|
| `npm run build` | Mit esbuild nach `dist/` bündeln |
| `npm run typecheck` | TypeScript-Typprüfung |
| `npm run auth` | Interaktive Authentifizierung ausführen |
| `npm start` | Server aus `dist/` starten |
| `npm run docs:check` | Übersetzungssynchronisation prüfen |

---

## 📄 Lizenz

MIT-Lizenz. Entwickelt mit ❤️ von [moodRobotics](https://github.com/moodRobotics).
