#!/bin/sh

# To be properl executed by datahub initialization need the +x flag 
# so you need to add it with chmod and commit/push it

DATAHUB_DIR=${1:-/usr/share/nginx/html/datahub}
SNIPPET="<script src='${HEADER_SCRIPT}'></script><geor-header active-app='datahub' stylesheet='${GEO_STYLESHEET}' logo-url='${LOGO_URL}'></geor-header>"

if grep -q "${SNIPPET}" "${DATAHUB_DIR}/index.html"; then
  echo "[INFO] geOrchestra: header already present."
  exit 0
fi

echo "[INFO] geOrchestra: adding header in the main page..."
sed -i "s#<body>#<body>${SNIPPET}#" ${DATAHUB_DIR}/index.html
