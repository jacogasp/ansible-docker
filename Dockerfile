FROM alpine:latest

RUN apk update && \
    apk add --no-cache \
    bash \
    ansible \
    openssh-keygen

RUN ssh-keygen -b 8192 -t rsa -f /root/.ssh/id_rsa -q -N ""

ENTRYPOINT ["/bin/bash"]

