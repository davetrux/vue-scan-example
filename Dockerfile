FROM nginx:1.16

RUN rm -f /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d

COPY dist /usr/share/nginx/html

EXPOSE 80
