#!/usr/bin/env bash
set -euo pipefail

DIR="/home/ubuntu/.openclaw/workspace/bibliotecatrading-skill"
REPO_HTTPS="https://github.com/hnovellaopenclaw-alt/bibliotecatrading.git"
TOKEN_ENV="${GITHUB_TOKEN:-}"

if [ -z "$TOKEN_ENV" ]; then
echo "ERROR: GITHUB_TOKEN no definido en el entorno."
exit 1
fi

cd "$DIR"
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || git init
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO_HTTPS"

if git ls-remote --exit-code --heads origin main >/dev/null 2>&1; then
git fetch origin main
git checkout main
else
git checkout -b main
fi

CREDENTIALS_FILE="$HOME/.git-credentials"
export GIT_ASKPASS=/bin/echo
mkdir -p "$(dirname "$CREDENTIALS_FILE")"
printf "https://%s:@github.com\n" "$TOKEN_ENV" > "$CREDENTIALS_FILE"
chmod 600 "$CREDENTIALS_FILE"

git config credential.helper store
git config user.name "OpenClaw Bot"
git config user.email "bot@openclaw.local"

git add .
git diff --cached --quiet || git commit -m "chore: initial local structure for bibliotecatrading-skill + draft SKILL.md"

git push -u origin main

rm -f "$CREDENTIALS_FILE"
unset GIT_ASKPASS
echo "Push completado."
