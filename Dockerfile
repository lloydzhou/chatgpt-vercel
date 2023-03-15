FROM alpine as git

RUN apk add git && mkdir -p /app && cd /app && git clone https://github.com/lloydzhou/chatgpt-vercel.git

FROM node:18.15.0-alpine3.17

COPY --from=git /app/chatgpt-vercel /app

RUN cd /app && yarn install && yarn run build && rm -rf node_modules/.vite

WORKDIR /app

CMD ["yarn", "run", "preview", "--host", "0.0.0.0", "--verbose"]
~                                       
