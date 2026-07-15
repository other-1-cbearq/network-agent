FROM alpine

# 1. 设置运行时环境变量（设置一个默认值，启动时可覆盖）
ENV AGENT_UUID=8cb447a2-09ce-4678-a104-0aa5fb53a181

# 2. 安装 HTTPS 证书支持和完整的 wget
RUN apk add --no-cache ca-certificates wget

# 3. 设置工作目录
WORKDIR /network-agent

# 4. 下载、解压并移动文件
RUN wget https://download.antping.com/update/network-agent.tar.gz && \
    tar -xzf network-agent.tar.gz && \
    rm -rf network-agent.tar.gz && chmod +x network-agent

# 5. 容器启动命令（先创建目录写入文件，再启动程序）
CMD ["sh", "-c", "mkdir -p conf && echo \"{\\\"uuid\\\":\\\"${AGENT_UUID}\\\"}\" > conf/conf.json && ./network-agent"]
