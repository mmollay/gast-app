#!/bin/bash
# Cloudflare Pages Deploy (direkt, ohne Merge/Tag)
# Wird nach git push auf main/develop ausgeführt
set -e

BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "☁️  Deploying to Cloudflare Pages (branch: $BRANCH)..."
npx wrangler pages deploy dashboard --project-name=hostel-app --branch=$BRANCH

echo "✅ Pages deploy complete!"
echo "🔗 https://gastauferden.at"
