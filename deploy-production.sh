#!/bin/bash
# Deploy to production environment (hostel-app)
# SSI Standard Workflow: Auto-Tag → Merge → Deploy → Push
set -e

echo "🚀 Deploying GastApp to PRODUCTION..."
echo "Branch: main"
echo "Target: gastauferden.at"
echo ""

# Ensure we're on main branch
git checkout main

# Merge develop into main
echo "📦 Merging develop into main..."
git merge develop --no-edit

# Auto-Tag: Version aus CHANGELOG oder Commit-Count
LAST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
COMMIT_COUNT=$(git rev-list --count HEAD)
# Increment patch version
MAJOR=$(echo $LAST_TAG | sed 's/v//' | cut -d. -f1)
MINOR=$(echo $LAST_TAG | sed 's/v//' | cut -d. -f2)
PATCH=$(echo $LAST_TAG | sed 's/v//' | cut -d. -f3)
NEW_TAG="v${MAJOR}.${MINOR}.$((PATCH + 1))"

echo "🏷️  Tagging: $NEW_TAG (vorher: $LAST_TAG)"
git tag -a "$NEW_TAG" -m "Release $NEW_TAG"

# Deploy to Cloudflare Pages (main branch = production)
echo "☁️  Deploying to Cloudflare Pages..."
npx wrangler pages deploy dashboard --project-name=hostel-app --branch=main

# Push changes + tags
git push origin main --tags

echo ""
echo "✅ Production deploy complete!"
echo "🏷️  Version: $NEW_TAG"
echo "🔗 https://gastauferden.at"
echo "↩️  Rollback: git checkout $LAST_TAG"
