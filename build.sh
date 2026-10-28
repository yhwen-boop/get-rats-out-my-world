#!/bin/sh
# 把 Artifact 版的 get-rats-out.html 包上完整网页外壳，生成 GitHub Pages 用的 index.html
set -e
cd "$(dirname "$0")"
SRC=get-rats-out.html
{
  printf '<!doctype html>\n<html lang="zh-CN">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  grep -m1 '<title>' "$SRC"
  printf '</head>\n<body>\n'
  grep -v -e '^<meta charset' -e '<title>' "$SRC"
  printf '</body>\n</html>\n'
} > index.html
echo "built index.html"
