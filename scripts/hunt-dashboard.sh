#!/bin/bash
# UI Enhancer: Starts a headless gemini session to summarize findings in a beautiful format.

if [ ! -d ".hunt-memory" ]; then
    echo -e "\033[1;31m🚨 Error: .hunt-memory directory not found. Start a hunt first.\033[0m"
else
    echo -e "\033[1;34m====================================================\033[0m"
    echo -e "\033[1;36m         GEMINI BUG BOUNTY SWARM DASHBOARD          \033[0m"
    echo -e "\033[1;34m====================================================\033[0m"

    gemini -p "Read all markdown files in the .hunt-memory/ directory and generate a highly condensed, beautiful ASCII dashboard summarizing the Attack Surface, Bugs Found, and Current State of the audit."
fi
