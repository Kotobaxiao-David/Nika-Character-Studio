#!/bin/bash
# Nika Character Studio - macOS 启动脚本

# 切换到脚本所在目录
cd "$(dirname "$0")" || exit 1

echo "Starting Nika Character Studio Server..."
echo ""
echo "Starting server on port: 9999"
echo "Server address: http://localhost:9999"
echo ""
echo "Press Ctrl+C to stop server"
echo ""

# 延迟2秒后自动打开浏览器
(sleep 2 && open "http://localhost:9999") &

# 启动 Python HTTP 服务器
if command -v python3 &>/dev/null; then
    python3 -m http.server 9999
elif command -v python &>/dev/null; then
    python -m http.server 9999
else
    echo ""
    echo "Error: Python not found. Please install Python 3."
    echo "  brew install python"
    echo ""
    exit 1
fi
