FROM alpine

# 设置默认 UUID，可在 docker run 时覆盖
ENV AGENT_UUID=8cb447a2-09ce-4678-a104-0aa5fb53a181

# 安装依赖
RUN apk add --no-cache ca-certificates wget tar

# 工作目录
WORKDIR /network-agent

# 复制启动脚本
COPY run.sh /network-agent/run.sh

# 赋予执行权限
RUN chmod +x /network-agent/run.sh

# 启动
CMD ["/network-agent/run.sh"]
