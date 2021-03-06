FROM ubuntu-1404

MAINTAINER hary <94093146@qq.com>

# 配置
ADD nginx.conf /etc/nginx/nginx.conf

#
ADD entrypoint.sh /entrypoint.sh

# 配置与日志
VOLUME /etc/nginx/deny
VOLUME /etc/nginx/sites-enabled
VOLUME /etc/nginx/certs
VOLUME /etc/nginx/conf.d
VOLUME /var/log/nginx

# 挂载各站点的静态资源
VOLUME /nginx/member/static
VOLUME /nginx/site/static
VOLUME /nginx/pay/static
VOLUME /nginx/admin/static
VOLUME /nginx/logistics/static
VOLUME /nginx/info/static
VOLUME /nginx/zrjt-pay/static
VOLUME /nginx/bid/static

# 上传文件挂载点
VOLUME /nginx/files

# 上传文件挂载点
VOLUME /nginx/zrjtFile

# nginx temp files
RUN mkdir -p /nginx/tmp

# 工作目录
WORKDIR /etc/nginx

# 开放端口
EXPOSE 80/tcp 443/tcp

# 启动命令
ENTRYPOINT [ "/entrypoint.sh" ]

# 命令参数
CMD [ "1000", "1000"]

