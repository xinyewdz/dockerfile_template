FROM node AS builder
ADD . /data
WORKDIR /data
RUN  npm config set registry http://registry.npm.taobao.org
RUN npm install && npm install gulp -g && npm run build

FROM nginx
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&echo 'Asia/Shanghai' >/etc/timezone
ENV TZ=Asia/Shanghai
COPY --from=builder /data/dist/ /usr/share/nginx/html

EXPOSE 80