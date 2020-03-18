FROM ubuntu:latest
LABEL mantainer="Evgeniy Naryshkin <aurcame@gmail.com>" \
      name="cpu and memory metrics" \
      version="1.0"
VOLUME /etc/passwd:/etc/passwd
WORKDIR /app

RUN apt-get update --yes && apt-get --yes install apt-utils \
    && apt-get --yes --no-install-recommends install python3 python3-dev python3-pip python3-setuptools \
    && apt-get --yes install gcc \
    && pip3 install --no-cache-dir colorama \
    && pip3 install --no-cache-dir psutil

COPY metrics .
ENTRYPOINT [ "/usr/bin/env", "python3", "./metrics" ]
CMD [ "cmd" ]
# CMD [ "/bin/bash" ]
