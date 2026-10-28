#!/bin/sh
# 把 Artifact 版的 get-rats-out.html 包上完整网页外壳，生成 GitHub Pages 用的 index.html
set -e
cd "$(dirname "$0")"
SRC=get-rats-out.html
{
  printf '<!doctype html>\n<html lang="zh-CN">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  grep -m1 '<title>' "$SRC"
  cat <<'HEAD'
<meta name="theme-color" content="#0d0e1a">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="apple-mobile-web-app-title" content="驱鼠办公室">
<link rel="apple-touch-icon" href="icon.png">
<link rel="icon" type="image/png" href="icon.png">
<style>
/* 与 Artifact 外壳一致的基础样式：刘海/底部横条安全区、隐藏元素 */
:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px);background:#0d0e1a}
[hidden]{display:none!important}
</style>
HEAD
  printf '</head>\n<body>\n'
  grep -v -e '^<meta charset' -e '<title>' "$SRC"
  printf '</body>\n</html>\n'
} > index.html
echo "built index.html"
