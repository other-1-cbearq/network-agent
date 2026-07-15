#!/bin/sh

set -e

cd /network-agent

echo "Downloading network-agent..."

# 删除旧文件
rm -rf network-agent network-agent.tar.gz

# 下载最新版本
wget -O network-agent.tar.gz https://download.antping.com/update/network-agent.tar.gz

# 解压
tar -xzf network-agent.tar.gz
rm -f network-agent.tar.gz

# 设置权限
chmod +x network-agent

# 生成配置
mkdir -p conf

cat > conf/conf.json <<EOF
{"uuid":"${AGENT_UUID}"}
EOF

echo "Starting network-agent..."
exec ./network-agent
