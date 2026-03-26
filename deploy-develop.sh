#!/bin/bash
# Deploy to dev environment (hostel-app)
set -e

echo "🚀 Deploying GastApp to DEV..."
echo "Branch: develop"
echo "Target: dev.gastauferden.at"
echo ""

# Ensure we're on develop branch
git checkout develop

# Build
npm run build

# Deploy to Cloudflare Pages (develop branch)
npx wrangler pages deploy dashboard --project-name=hostel-app --branch=develop

echo ""
echo "✅ Deploy complete!"
echo "🔗 https://dev.gastauferden.at"
