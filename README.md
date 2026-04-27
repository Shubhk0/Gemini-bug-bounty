# Gemini Bug Bounty

An autonomous bug bounty hunting, smart contract auditing, and attack surface discovery tool powered by the official **Google Gemini CLI** (`@google/gemini-cli`).

Inspired by `claude-bug-bounty`, this project brings the same modular skill-based architecture to Gemini, leveraging its massive **1M-2M token context window** and native shell integration.

## Features

*   **Context-Aware Templates (`GEMINI.md`)**: Drop a specific template into your working directory to instantly turn Gemini into a specialized agent (Recon, Auditing, Report Writing).
*   **Native Shell Execution**: Gemini CLI interacts directly with installed security tools (`subfinder`, `nuclei`, `httpx`) without needing Python middleware.
*   **Persistent Memory**: Uses Gemini's massive context window and local filesystem tools to maintain session logs, so it remembers what it tested yesterday.
*   **Web2 & Web3 Skills**: Includes methodologies for web vulnerabilities (IDOR, SSRF, SQLi) and smart contract flaws (Reentrancy, Access Control).

## Installation

### 1. Install Gemini CLI
You need Node.js installed.
```bash
npm install -g @google/gemini-cli@latest
gemini --version
```
Authenticate via Google or API Key (see [Gemini CLI Auth](https://github.com/google-gemini/gemini-cli)).

### 2. Install Security Tools
```bash
chmod +x install_tools.sh
./install_tools.sh
```

### 3. Install Gemini Bug Bounty Scripts
```bash
chmod +x install.sh
./install.sh
```

## Usage

Create a directory for your target and run one of the specialized aliases:

```bash
mkdir my-target && cd my-target

# Start a recon session
gemini-recon target.com

# Start a full bug hunting session
gemini-hunt target.com

# Start a Web3 smart contract audit
gemini-web3-audit
```

This will automatically copy the appropriate `GEMINI.md` context file into your folder and start the Gemini interactive session.

Inside the interactive prompt, you can tell Gemini:
> "Start scanning target.com using subfinder and analyze the results"
> "Audit the MyToken.sol file in this directory"
> "Write a HackerOne report for the SSRF we just found"

## Architecture

This tool relies on **Context Templates** (`templates/*-GEMINI.md`). By placing a highly structured `GEMINI.md` file in the current directory, the Gemini CLI automatically reads it, adopting the specific persona, methodology, and strict operating rules defined within. Memory is persisted by instructing the AI to read/write to local markdown files in a `.hunt-memory` directory.
