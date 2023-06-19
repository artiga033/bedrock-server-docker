FROM ubuntu
EXPOSE 19132/udp
ARG VERSION
WORKDIR "/server"
RUN apt update \
    && apt install -y curl unzip &&\
    curl "https://minecraft.azureedge.net/bin-linux/bedrock-server-${VERSION}.zip" -o server.zip &&\
    unzip server.zip &&\
    rm server.zip && \ 
    rm -rf /var/lib/apt/lists/*
VOLUME [ "/server/worlds" ]

ENV LD_LIBRARY_PATH="."
ENTRYPOINT [ "/server/bedrock_server" ]