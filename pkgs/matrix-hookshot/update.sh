#!/usr/bin/env nix-shell
#!nix-shell -i bash -p nix curl jq prefetch-yarn-deps nix-prefetch-github nix-prefetch-git

if [ "$#" -gt 1 ] || [[ "$1" == -* ]]; then
  echo "Regenerates packaging data for matrix-hookshot."
  echo "Usage: $0 [git release tag]"
  exit 1
fi

outdir=$(dirname "$0")
version="$1"
set -euo pipefail

if [ -z "$version" ]; then
  version="$(curl "https://api.github.com/repos/matrix-org/matrix-hookshot/releases?per_page=1" | jq -r '.[0].tag_name')"
fi

src="https://raw.githubusercontent.com/matrix-org/matrix-hookshot/$version"
src_hash=$(nix-prefetch-github matrix-org matrix-hookshot --rev ${version} | jq -r .sha256)

tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT

pushd $tmpdir
curl -O "$src/yarn.lock"
yarn_hash=$(prefetch-yarn-deps yarn.lock)
popd

curl --output $outdir/package.json "$src/package.json"

cat > $outdir/data.json << EOF
{
  "version": "$version",
  "srcHash": "$src_hash",
  "yarnHash": "$yarn_hash"
}
EOF
