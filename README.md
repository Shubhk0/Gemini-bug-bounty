# Gemini Bug Bounty Swarm

An autonomous bug bounty hunting, smart contract auditing, and attack surface discovery swarm powered by the official **Google Gemini CLI** (`@google/gemini-cli`) using native **Agent Skills**.

Inspired by `claude-bug-bounty`, this project brings the same modular architecture to Gemini, leveraging its massive **1M-2M token context window**, native shell integration, and **Multi-Agent Skill Swarm** capabilities.

## Features

*   **Native Agent Skills**: Fully utilizes the new `gemini skills` architecture. No clunky bash wrappers needed.
*   **Swarm Orchestrator**: The `bb-methodology` skill acts as the Commander, automatically delegating specific phases (recon, auth testing, auditing) to the correct sub-agent.
*   **Beautiful UI Dashboard**: Includes a `hunt-dashboard.sh` script to parse memory logs into a beautiful terminal view.
*   **Native Shell Execution**: Gemini CLI interacts directly with installed security tools (`subfinder`, `nuclei`, `httpx`) without needing Python middleware.
*   **Persistent Memory**: Uses local filesystem tools to maintain session logs (`.hunt-memory/`), so it remembers what it tested yesterday.

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

### 3. Link Agent Skills
```bash
chmod +x install.sh
./install.sh
```

## Usage

Create a directory for your target and simply start Gemini:

```bash
mkdir my-target && cd my-target
gemini
```

Inside the interactive prompt, you can activate the Swarm Commander:
> "Activate the bb-methodology skill and let's start hunting on target.com"

The Swarm Commander will automatically instruct the CLI to activate the `web2-recon` skill, the `auth-testing` skill, or the `web3-audit` skill based on what is needed.

### Dashboard UI
To get a beautiful bird's-eye view of your current hunt:
```bash
~/.local/bin/hunt-dashboard
```

## Advanced Browsing
If `curl` is insufficient for parsing complex API responses, the Swarm utilizes the built-in helper script:
`~/.local/bin/browser-helper <url> -H "Cookie: session=xyz"`
This script automatically formats JSON, truncates massive HTML responses to save context, and handles SSL verification errors smoothly.
