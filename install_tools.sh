#!/bin/bash
# Install required bug bounty tools (subfinder, httpx, nuclei)

echo "Installing required security tools..."

if ! command -v go &> /dev/null; then
    echo "Error: Go is not installed. Please install Go first."
else
    echo "Installing ProjectDiscovery tools..."
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest

    # Ensure GOPATH/bin is in PATH
    export PATH=$PATH:$(go env GOPATH)/bin

    echo "Tools installed successfully!"
    echo "Make sure $(go env GOPATH)/bin is in your PATH."
fi
