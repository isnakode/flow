#!/bin/bash

EXT=${1:-svelte}  # default to 'js' if no argument given

echo "Perbandingan sebelum dan setelah refactor"

echo -n "Sebelum: "
git ls-tree -r HEAD^ --name-only | grep "\.$EXT$" | grep -vE '^(node_modules|dist|build|\.git)/' | while read file; do git show HEAD^:"$file"; done | wc -l

echo -n "Sesudah: "
find . -name "*.$EXT" \
  -type f \
  -not -path "./node_modules/*" \
  -not -path "./dist/*" \
  -not -path "./build/*" \
  -not -path "./.git/*" \
  | xargs cat | wc -l
