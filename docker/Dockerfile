FROM alpine:latest
RUN apk -U add ca-certificates curl openssl python3 python3-dev py3-pip py3-setuptools postgresql-dev g++ make less && pip3 install pgcli && apk del python3-dev py3-pip g++ make
ENV PAGER=less
ENTRYPOINT ["/bin/ash"]
