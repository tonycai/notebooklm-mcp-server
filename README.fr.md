<p align="center">
  <img src="./notebooklm_mcp_logo.png" width="200" alt="Logo Notebook-mcp-server">
</p>

<h1 align="center">Serveur MCP NotebookLM</h1>

<p align="center">
  <b>Laissez vos agents IA discuter directement avec Google NotebookLM pour des réponses sans hallucination.</b>
</p>

<p align="center">
  <a href="README.md">English</a> • 
  <a href="README.es.md">Español</a> • 
  <b>Français</b> • 
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
  <a href="#authentification">Authentification</a> • 
  <a href="#démarrage-rapide-claude-desktop">Démarrage Rapide</a> • 
  <a href="#compétence-claude-code">Claude Code</a> • 
  <a href="#documentation">Documentation</a> •
  <a href="#développement">Développement</a>
</p>

## La Solution

Le **Serveur MCP NotebookLM** apporte la puissance de Google NotebookLM directement dans votre flux de travail augmenté par l'IA. Construit nativement en **TypeScript** via le Model Context Protocol, il permet aux agents de lire, rechercher et gérer vos carnets de notes comme s'il s'agissait de fichiers locaux.

---

## 🚀 Installation

### 1. Installation Globale (Recommandée)

Vous pouvez installer le serveur directement depuis NPM :

```bash
npm install -g notebooklm-mcp-server
```

> [!NOTE]
> **Mise à jour automatique** : Le serveur vérifie automatiquement les nouvelles versions au démarrage. Si une mise à jour existe, elle s'installera d'elle-même et vous demandera de redémarrer pour garantir que vous disposez toujours des derniers correctifs Google.

### 2. Utilisation directe avec NPX (Zéro-Config)

Si vous ne souhaitez pas l'installer globalement, vous pouvez l'exécuter directement :

```bash
npx notebooklm-mcp-server auth   # Pour se connecter
npx notebooklm-mcp-server start  # Pour lancer le serveur
```

---

## 🔑 Authentification

Avant d'utiliser le serveur, vous devez le lier à votre compte Google. Cette version utilise une session de navigateur sécurisée et persistante :

1. Lancez la commande d'authentification :
   ```bash
   npx notebooklm-mcp-server auth
   ```
2. Une fenêtre de navigateur s'ouvrira. Connectez-vous avec votre compte Google.
3. Fermez le navigateur une fois que vous voyez vos carnets de notes. Votre session est maintenant enregistrée localement en toute sécurité.

> [!TIP]
> **Session expirée ?** Si votre agent reçoit des erreurs d'authentification, demandez-lui simplement d'exécuter la commande `npx notebooklm-mcp-server refresh_auth`. Cela ouvrira automatiquement le navigateur pour que vous puissiez renouveler la session sans quitter votre chat.

---

## ⚡ Démarrage Rapide

### 🤖 Claude Desktop

Ajoutez ce qui suit à votre fichier `claude_desktop_config.json` :

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

Comme VS Code ne supporte pas encore nativement le MCP, vous devez utiliser une extension :

#### Option A : Utiliser [Cline](https://marketplace.visualstudio.com/items?itemName=saoudrizwan.claude-dev) (Recommandé)

1. Ouvrez les **Paramètres de Cline** dans VS Code.
2. Faites défiler jusqu'à la section **MCP Servers**.
3. Cliquez sur **Add New MCP Server**.
4. Utilisez la configuration suivante :
   - **Nom** : `notebooklm`
   - **Commande** : `npx -y notebooklm-mcp-server start`

#### Option B : Utiliser [MCP Client](https://marketplace.visualstudio.com/items?itemName=stefan-mcp.mcp-client)

1. Installez l'extension depuis le Marketplace.
2. Ouvrez votre `settings.json` VS Code.
3. Ajoutez le serveur sous `mcp.servers` :
   ```json
   "mcp.servers": {
     "notebooklm": {
       "command": "npx",
       "args": ["-y", "notebooklm-mcp-server", "start"]
     }
   }
   ```

### 🌌 Antigravity

Antigravity supporte nativement le MCP. Vous pouvez ajouter le serveur en éditant votre fichier de configuration globale :

1. **Localisez votre `mcp.json`** :
   - **Windows** : `%APPDATA%\antigravity\mcp.json`
   - **macOS** : `~/Library/Application Support/antigravity/mcp.json`
   - **Linux** : `~/.config/antigravity/mcp.json`

2. **Ajoutez le serveur** à l'objet `mcpServers` :

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

3. **Redémarrez Antigravity** : Les nouveaux outils apparaîtront instantanément dans votre barre latérale.

---

### 💎 Gemini CLI

Exécutez la commande suivante dans votre terminal pour ajouter la compétence notebooklm :

```bash
gemini mcp add notebooklm --scope user -- npx -y notebooklm-mcp-server start
```

---

## 🤖 Compétence Claude Code

Ajoutez-la instantanément à Claude Code :

```bash
claude skill add notebooklm -- "npx -y notebooklm-mcp-server start"
```

---

## 📖 Documentation

### 28 Outils Disponibles

<details>
<summary><b>📒 Gestion des Carnets</b> (4 outils)</summary>

| Outil               | Description                                           |
| :------------------ | :---------------------------------------------------- |
| `notebook_list`     | Liste tous les carnets avec sources et métadonnées.   |
| `notebook_create`   | Crée un nouveau carnet avec un titre.                 |
| `notebook_rename`   | Renomme un carnet existant.                           |
| `notebook_delete`   | Supprime un carnet définitivement (**irréversible**). |

</details>

<details>
<summary><b>🖇️ Gestion des Sources</b> (6 outils)</summary>

| Outil                     | Description                                              |
| :------------------------ | :------------------------------------------------------- |
| `notebook_add_url`        | Ajoute un site Web ou une vidéo YouTube comme source.    |
| `notebook_add_text`       | Ajoute un contenu textuel personnalisé comme source.     |
| `notebook_add_local_file` | Télécharge un fichier local PDF, Markdown ou Texte.      |
| `notebook_add_drive`      | Ajoute un fichier Google Drive (Docs, Slides, Sheets, PDF). |
| `source_delete`           | Supprime une source définitivement (**irréversible**).   |
| `source_sync`             | Synchronise une source Drive pour obtenir la dernière version. |

</details>

<details>
<summary><b>🔍 Recherche & Requêtes</b> (5 outils)</summary>

| Outil               | Description                                           |
| :------------------ | :---------------------------------------------------- |
| `notebook_query`    | Interroge l'IA sur les sources existantes d'un carnet. |
| `chat_configure`    | Configure l'objectif du chat (défaut, guide d'apprentissage, personnalisé) et la longueur de réponse. |
| `research_start`    | Lance une recherche web ou Drive (`fast` ~30s ou `deep` ~5min). |
| `research_poll`     | Interroge l'état et les sources découvertes.          |
| `research_import`   | Importe les sources découvertes dans le carnet.       |

</details>

<details>
<summary><b>🎨 Studio & Génération</b> (9 outils)</summary>

| Outil                    | Description                                           |
| :----------------------- | :---------------------------------------------------- |
| `audio_overview_create`  | Génère un aperçu audio (podcast).                     |
| `video_overview_create`  | Génère un aperçu vidéo.                               |
| `report_create`          | Génère un rapport écrit à partir des sources.         |
| `flashcards_create`      | Génère des cartes mémoire à partir des sources.       |
| `infographic_create`     | Génère une infographie à partir des sources.          |
| `slide_deck_create`      | Génère un diaporama à partir des sources.             |
| `data_table_create`      | Génère un tableau de données à partir des sources.    |
| `studio_poll`            | Vérifie l'état de tous les artefacts studio.          |
| `studio_delete`          | Supprime un artefact studio.                          |

</details>

<details>
<summary><b>🧠 Cartes Mentales</b> (4 outils)</summary>

| Outil               | Description                                          |
| :------------------ | :--------------------------------------------------- |
| `mind_map_generate` | Génère un JSON de carte mentale à partir des sources. |
| `mind_map_save`     | Sauvegarde une carte mentale dans le carnet.         |
| `mind_map_list`     | Liste toutes les cartes mentales d'un carnet.        |
| `mind_map_delete`   | Supprime une carte mentale d'un carnet.              |

</details>

<details>
<summary><b>⚙️ Système</b> (1 outil)</summary>

| Outil           | Description                                                        |
| :-------------- | :----------------------------------------------------------------- |
| `refresh_auth`  | Recharge les cookies depuis le disque. Lancez `notebooklm-mcp-server auth` d'abord si expirés. |

</details>

> Pour les détails complets des paramètres, consultez [docs/TOOLS.md](docs/TOOLS.md).

---

## 💡 Exemples d'Utilisation

Ces exemples montrent ce que vous pouvez demander à votre agent IA une fois le serveur connecté.

### Flux de Base — Créer, Ajouter des Sources et Interroger

```
"Crée un carnet appelé 'Recherche Rust' et ajoute ces sources :
 - https://doc.rust-lang.org/book/
 - https://www.youtube.com/watch?v=OX9HJsJUDxA
Puis demande : Quelles sont les différences clés entre ownership et borrowing ?"
```

### Télécharger des Fichiers Locaux

```
"Ajoute mes notes de ./notes/architecture.md et ./docs/spec.pdf
au carnet 'Conception du Projet', puis résume les décisions clés."
```

### Recherche Web

```
"Dans mon carnet 'Sécurité IA', lance une recherche web approfondie sur
'derniers développements en alignement IA 2026' et importe les
meilleurs résultats comme sources."
```

### Générer du Contenu Studio

```
"Génère un aperçu audio style podcast de mon carnet 'Rapport Trimestriel',
axé sur les tendances de revenus, en français."
```

```
"Crée des cartes mémoire de mon carnet 'Biologie 101' pour les
sources sur la division cellulaire."
```

### Cartes Mentales

```
"Génère une carte mentale de toutes les sources de mon carnet 'Stratégie Produit',
puis sauvegarde-la avec le titre 'Aperçu de la Feuille de Route Q2'."
```

### Flux de Travail Multi-étapes

```
"1. Liste tous mes carnets
 2. Dans le carnet 'Machine Learning', recherche 'architectures transformer 2026'
 3. Attends les résultats, puis importe les 5 meilleures sources
 4. Interroge le carnet : 'Compare les mécanismes d'attention des articles importés'
 5. Génère un rapport avec les conclusions"
```

---

## 🐳 Déploiement Docker

Exécutez le serveur dans un conteneur pour des déploiements isolés et reproductibles.

### Prérequis

Authentifiez-vous sur l'hôte d'abord (nécessite un navigateur) :

```bash
npx notebooklm-mcp-server auth
```

### Construire et Exécuter

```bash
docker compose build
docker compose up -d
```

Ou exécuter interactivement :

```bash
docker compose run --rm notebooklm-mcp-server
```

Le `docker-compose.yml` monte `~/.notebooklm-mcp` en lecture seule dans le conteneur pour accéder aux cookies de session. Alternativement, passez les cookies via la variable d'environnement `NOTEBOOKLM_COOKIES`.

> [!NOTE]
> L'image Docker utilise une construction multi-étapes avec `node:20-slim` et ignore le téléchargement de Playwright/Chromium, résultant en une image de ~117 Mo. L'authentification doit se faire sur l'hôte car elle nécessite un navigateur.

---

## 🏗️ Architecture

```
┌─────────────────┐     stdio      ┌──────────────────────────┐
│   Client MCP    │◄──────────────►│   Serveur MCP            │
│ (Claude, Cursor │                │   (server.ts)            │
│  Cline, etc.)   │                │   - Définition des outils│
└─────────────────┘                │   - Validation des entrées│
                                   └────────────┬─────────────┘
                                                │
                                   ┌────────────▼─────────────┐
                                   │  NotebookLMClient        │
                                   │  (client.ts)             │
                                   │   - RPC batchexecute     │
                                   │   - Gestion CSRF         │
                                   │   - Rechargement cookies │
                                   └────────────┬─────────────┘
                                                │ HTTPS
                                   ┌────────────▼─────────────┐
                                   │  Google NotebookLM       │
                                   │  (notebooklm.google.com) │
                                   └──────────────────────────┘
```

### Composants Principaux

| Fichier | Fonction |
|---------|----------|
| `src/server.ts` | Serveur MCP — enregistre 28 outils, valide les entrées, dispatch au client |
| `src/client.ts` | Client API NotebookLM — RPC batchexecute, analyse des réponses, streaming des requêtes |
| `src/auth.ts` | Authentification via Playwright, extraction et stockage des cookies |
| `src/constants.ts` | IDs RPC, endpoints, build label, timeouts |
| `src/update.ts` | Vérificateur de mises à jour automatiques |
| `src/index.ts` | Point d'entrée CLI (commander) — sous-commandes `server` et `auth` |

---

## 🔒 Sécurité

- **Protection contre le Path Traversal** : Les uploads de fichiers locaux sont restreints au répertoire de travail actuel
- **Stockage des Identifiants** : Cookies sauvegardés avec permissions `0600` (lecture/écriture propriétaire uniquement) dans un répertoire `0700`
- **Validation des Entrées** : Les 28 gestionnaires d'outils valident les paramètres requis avant traitement
- **Assainissement des Erreurs** : Les erreurs Axios sont assainies pour empêcher la fuite de cookies/en-têtes dans les réponses MCP
- **Prévention d'Injection de Commandes** : Le metteur à jour Windows rejette les arguments contenant des métacaractères shell
- **HTTPS Uniquement** : Toute communication avec Google NotebookLM est sur HTTPS

---

## 🛠️ Développement

### Compiler à partir des Sources

```bash
git clone https://github.com/tonycai/notebooklm-mcp-server.git
cd notebooklm-mcp-server
npm install
npm run build
```

### Scripts Disponibles

| Script | Description |
|--------|-------------|
| `npm run build` | Empaqueter avec esbuild vers `dist/` |
| `npm run typecheck` | Vérification des types TypeScript |
| `npm run auth` | Lancer l'authentification interactive |
| `npm start` | Démarrer le serveur depuis `dist/` |
| `npm run docs:check` | Vérifier la synchronisation des traductions |

---

## 📄 Licence

Licence MIT. Développé avec ❤️ par [moodRobotics](https://github.com/moodRobotics).
