<p align="center">
  <img src="./notebooklm_mcp_logo.png" width="200" alt="Logo do Notebook-mcp-server">
</p>

<h1 align="center">Servidor MCP do NotebookLM</h1>

<p align="center">
  <b>Permita que seus agentes de IA conversem diretamente con o Google NotebookLM para respostas sem alucinações.</b>
</p>

<p align="center">
  <a href="README.md">English</a> • 
  <a href="README.es.md">Español</a> • 
  <a href="README.fr.md">Français</a> • 
  <b>Português</b> • 
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
  <a href="#instalação">Instalação</a> • 
  <a href="#autenticação">Autenticação</a> • 
  <a href="#início-rápido-claude-desktop">Início Rápido</a> • 
  <a href="#habilidade-do-claude-code">Claude Code</a> • 
  <a href="#documentação">Documentación</a> •
  <a href="#desenvolvimento">Desenvolvimento</a>
</p>

## A Solução

O **Servidor MCP do NotebookLM** traz o poder do NotebookLM do Google diretamente para o seu fluxo de trabalho aumentado por IA. Desenvolvido nativamente en **TypeScript** usando o Model Context Protocol, ele permite que os agentes leiam, pesquisem e gerenciem seus cadernos como se fossem arquivos locais.

---

## 🚀 Instalação

### 1. Instalação Global (Recomendada)

Você pode instalar o servidor directamente pelo NPM:

```bash
npm install -g notebooklm-mcp-server
```

> [!NOTE]
> **Auto-atualização**: O servidor verifica automaticamente novas versões na inicialização. Se houver uma atualização, ela será instalada sozinha e solicitará que você reinicie para garantir que sempre tenha as correções mais recentes do Google.

### 2. Uso direto com NPX (Zero-Config)

Se você não quiser instalá-lo globalmente, pode executá-lo diretamente:

```bash
npx notebooklm-mcp-server auth   # Para logar
npx notebooklm-mcp-server start  # Para rodar o servidor
```

---

## 🔑 Autenticação

Antes de usar o servidor, você deve conectá-lo à sua Conta do Google. Esta versão usa uma seção de navegador segura e persistente:

1. Execute o comando de autenticação:
   ```bash
   npx notebooklm-mcp-server auth
   ```
2. Uma janela do navegador será aberta. Faça login com sua conta do Google.
3. Feche o navegador assim que visualizar seus cadernos. Sua sessão agora está salva localmente de forma segura.

> [!TIP]
> **Sessão Expirada?** Se o seu agente receber erros de autenticação, basta pedir que ele execute o comando `npx notebooklm-mcp-server refresh_auth`. Ele abrirá automaticamente o navegador para você renovar a sessão sem sair do chat.

---

## ⚡ Início Rápido

### 🤖 Claude Desktop

Adicione o seguinte ao seu `claude_desktop_config.json`:

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

Como o VS Code ainda não suporta MCP nativamente, você deve usar uma extensão:

#### Opção A: Usando [Cline](https://marketplace.visualstudio.com/items?itemName=saoudrizwan.claude-dev) (Recomendado)

1. Abra as **Configurações do Cline** no VS Code.
2. Role até a seção **MCP Servers**.
3. Clique em **Add New MCP Server**.
4. Use a seguinte configuração:
   - **Nome**: `notebooklm`
   - **Comando**: `npx -y notebooklm-mcp-server start`

#### Opção B: Usando [MCP Client](https://marketplace.visualstudio.com/items?itemName=stefan-mcp.mcp-client)

1. Instale a extensão no Marketplace.
2. Abra o seu `settings.json` do VS Code.
3. Adicione o servidor sob `mcp.servers`:
   ```json
   "mcp.servers": {
     "notebooklm": {
       "command": "npx",
       "args": ["-y", "notebooklm-mcp-server", "start"]
     }
   }
   ```

### 🌌 Antigravity

O Antigravity suporta MCP nativamente. Você pode adicionar o servidor editando o seu arquivo de configuração global:

1. **Localize o seu `mcp.json`**:
   - **Windows**: `%APPDATA%\antigravity\mcp.json`
   - **macOS**: `~/Library/Application Support/antigravity/mcp.json`
   - **Linux**: `~/.config/antigravity/mcp.json`

2. **Adicione o servidor** ao objeto `mcpServers`:

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

3. **Reinicie o Antigravity**: As novas ferramentas aparecerão na sua barra lateral instantaneamente.

---

### 💎 Gemini CLI

Execute o seguinte comando no seu terminal para adicionar a habilidade notebooklm:

```bash
gemini mcp add notebooklm --scope user -- npx -y notebooklm-mcp-server start
```

---

## 🤖 Habilidade do Claude Code

Adicione instantaneamente ao Claude Code:

```bash
claude skill add notebooklm -- "npx -y notebooklm-mcp-server start"
```

---

## 📖 Documentação

### 28 Ferramentas Disponíveis

<details>
<summary><b>📒 Gerenciamento de Cadernos</b> (4 ferramentas)</summary>

| Ferramenta         | Descrição                                             |
| :----------------- | :---------------------------------------------------- |
| `notebook_list`    | Lista todos os cadernos com fontes e metadados.       |
| `notebook_create`  | Cria um novo caderno com um título.                   |
| `notebook_rename`  | Renomeia um caderno existente.                        |
| `notebook_delete`  | Exclui um caderno permanentemente (**irreversível**). |

</details>

<details>
<summary><b>🖇️ Gerenciamento de Fontes</b> (6 ferramentas)</summary>

| Ferramenta                | Descrição                                              |
| :------------------------ | :----------------------------------------------------- |
| `notebook_add_url`        | Adiciona um site ou vídeo do YouTube como fonte.       |
| `notebook_add_text`       | Adiciona conteúdo de texto personalizado como fonte.   |
| `notebook_add_local_file` | Faz upload de um arquivo local PDF, Markdown ou Texto. |
| `notebook_add_drive`      | Adiciona um arquivo do Google Drive (Docs, Slides, Sheets, PDF). |
| `source_delete`           | Remove uma fonte permanentemente (**irreversível**).   |
| `source_sync`             | Sincroniza uma fonte do Drive para obter a versão mais recente. |

</details>

<details>
<summary><b>🔍 Pesquisa e Consulta</b> (5 ferramentas)</summary>

| Ferramenta         | Descrição                                             |
| :----------------- | :---------------------------------------------------- |
| `notebook_query`   | Pergunte à IA sobre as fontes existentes em um caderno. |
| `chat_configure`   | Configura o objetivo do chat (padrão, guia de aprendizado, personalizado) e o tamanho da resposta. |
| `research_start`   | Inicia pesquisa web ou Drive (`fast` ~30s ou `deep` ~5min). |
| `research_poll`    | Consulta o status e as fontes descobertas.            |
| `research_import`  | Importa as fontes descobertas para o caderno.         |

</details>

<details>
<summary><b>🎨 Estúdio e Geração</b> (9 ferramentas)</summary>

| Ferramenta              | Descrição                                             |
| :---------------------- | :---------------------------------------------------- |
| `audio_overview_create` | Gera um resumo em áudio (podcast).                    |
| `video_overview_create` | Gera um resumo em vídeo.                              |
| `report_create`         | Gera um relatório escrito a partir das fontes.        |
| `flashcards_create`     | Gera cartões de estudo a partir das fontes.           |
| `infographic_create`    | Gera um infográfico a partir das fontes.              |
| `slide_deck_create`     | Gera uma apresentação de slides.                      |
| `data_table_create`     | Gera uma tabela de dados a partir das fontes.         |
| `studio_poll`           | Verifica o status de todos os artefatos de estúdio.   |
| `studio_delete`         | Exclui um artefato de estúdio.                        |

</details>

<details>
<summary><b>🧠 Mapas Mentais</b> (4 ferramentas)</summary>

| Ferramenta          | Descrição                                            |
| :------------------ | :--------------------------------------------------- |
| `mind_map_generate` | Gera um JSON de Mapa Mental a partir das fontes.     |
| `mind_map_save`     | Salva um mapa mental gerado no caderno.              |
| `mind_map_list`     | Lista todos os mapas mentais de um caderno.          |
| `mind_map_delete`   | Exclui um mapa mental de um caderno.                 |

</details>

<details>
<summary><b>⚙️ Sistema</b> (1 ferramenta)</summary>

| Ferramenta     | Descrição                                                          |
| :------------- | :----------------------------------------------------------------- |
| `refresh_auth` | Recarrega cookies do disco. Execute `notebooklm-mcp-server auth` primeiro se estiverem expirados. |

</details>

> Para detalhes completos dos parâmetros, consulte [docs/TOOLS.md](docs/TOOLS.md).

---

## 💡 Exemplos de Uso

Estes exemplos mostram o que você pode pedir ao seu agente de IA uma vez que o servidor estiver conectado.

### Fluxo Básico — Criar, Adicionar Fontes e Consultar

```
"Crie um caderno chamado 'Pesquisa Rust' e adicione estas fontes:
 - https://doc.rust-lang.org/book/
 - https://www.youtube.com/watch?v=OX9HJsJUDxA
Depois pergunte: Quais são as diferenças chave entre ownership e borrowing?"
```

### Enviar Arquivos Locais

```
"Adicione minhas notas de ./notes/arquitetura.md e ./docs/spec.pdf
ao caderno 'Design do Projeto', depois resuma as decisões principais."
```

### Pesquisa Web

```
"No meu caderno 'Segurança IA', inicie uma pesquisa web profunda sobre
'últimos desenvolvimentos em alinhamento de IA 2026' e importe os
melhores resultados como fontes."
```

### Gerar Conteúdo de Estúdio

```
"Gere um resumo em áudio estilo podcast do meu caderno 'Relatório Trimestral',
focado em tendências de receita, em português."
```

```
"Crie cartões de estudo do meu caderno 'Biologia 101' para as
fontes sobre divisão celular."
```

### Mapas Mentais

```
"Gere um mapa mental de todas as fontes do meu caderno 'Estratégia de Produto',
depois salve-o com o título 'Visão Geral do Roadmap Q2'."
```

### Fluxo de Trabalho Multi-etapas

```
"1. Liste todos os meus cadernos
 2. No caderno 'Machine Learning', pesquise 'arquiteturas transformer 2026'
 3. Aguarde os resultados, depois importe as 5 melhores fontes
 4. Consulte o caderno: 'Compare os mecanismos de atenção nos artigos importados'
 5. Gere um relatório com as conclusões"
```

---

## 🛠️ Desenvolvimento

Para contribuir ou construir a partir do código fonte:

```bash
git clone https://github.com/moodRobotics/notebook-mcp-server.git
npm install
npm run build
```

## 📄 Licença

Licença MIT. Desenvolvido com ❤️ pela [moodRobotics](https://github.com/moodRobotics).
