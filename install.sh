#!/bin/bash
# Install Gemini Bug Bounty Agent Skills and scripts

echo "Installing Gemini Bug Bounty Swarm..."

INSTALL_DIR="${HOME}/.gemini-bug-bounty"
BIN_DIR="${HOME}/.local/bin"

mkdir -p "${INSTALL_DIR}/skills"
mkdir -p "${BIN_DIR}"

# Copy skills and scripts
cp -r skills/* "${INSTALL_DIR}/skills/" 2>/dev/null || true
cp scripts/browser-helper.py "${BIN_DIR}/browser-helper" 2>/dev/null || true
cp scripts/hunt-dashboard.sh "${BIN_DIR}/hunt-dashboard" 2>/dev/null || true
chmod +x "${BIN_DIR}/browser-helper"
chmod +x "${BIN_DIR}/hunt-dashboard"

# Link native Agent Skills to Gemini CLI
echo "Linking Agent Skills to Gemini CLI..."
for skill_dir in "${INSTALL_DIR}/skills"/*; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        gemini skills link "$skill_dir" || echo "Failed to link $skill_name (Is gemini CLI installed?)"
    fi
done

echo "Installed successfully!"
echo "Make sure ${BIN_DIR} is in your PATH."
echo "You can now run 'gemini' and activate your skills!"
