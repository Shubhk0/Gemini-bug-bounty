#!/bin/bash
# Install Gemini Bug Bounty aliases and scripts

echo "Installing Gemini Bug Bounty scripts..."

INSTALL_DIR="${HOME}/.gemini-bug-bounty"
BIN_DIR="${HOME}/.local/bin"

mkdir -p "${INSTALL_DIR}/templates"
mkdir -p "${BIN_DIR}"

# Copy templates
cp templates/* "${INSTALL_DIR}/templates/" 2>/dev/null || true

# Create wrapper scripts
cat << 'SCRIPT_EOF' > "${BIN_DIR}/gemini-recon"
#!/bin/bash
cp "${HOME}/.gemini-bug-bounty/templates/web2-recon-GEMINI.md" ./GEMINI.md
echo "Recon template copied to $(pwd)/GEMINI.md"
gemini
SCRIPT_EOF

cat << 'SCRIPT_EOF' > "${BIN_DIR}/gemini-hunt"
#!/bin/bash
cp "${HOME}/.gemini-bug-bounty/templates/bb-methodology-GEMINI.md" ./GEMINI.md
echo "Bug hunting template copied to $(pwd)/GEMINI.md"
gemini
SCRIPT_EOF

cat << 'SCRIPT_EOF' > "${BIN_DIR}/gemini-web3-audit"
#!/bin/bash
cp "${HOME}/.gemini-bug-bounty/templates/web3-audit-GEMINI.md" ./GEMINI.md
echo "Web3 audit template copied to $(pwd)/GEMINI.md"
gemini
SCRIPT_EOF

cat << 'SCRIPT_EOF' > "${BIN_DIR}/gemini-report"
#!/bin/bash
cp "${HOME}/.gemini-bug-bounty/templates/report-writer-GEMINI.md" ./GEMINI.md
echo "Report writer template copied to $(pwd)/GEMINI.md"
gemini
SCRIPT_EOF

chmod +x "${BIN_DIR}/gemini-"*

echo "Installed successfully!"
echo "Make sure ${BIN_DIR} is in your PATH."
echo "You can now run: gemini-recon, gemini-hunt, gemini-web3-audit, gemini-report"
