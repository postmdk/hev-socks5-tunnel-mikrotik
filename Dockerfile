FROM alpine:latest AS build

RUN apk add --no-cache curl jq
ARG TARGETARCH
WORKDIR /tmp

# Get latest release from GitHub, download the files and save them with new names
RUN RELEASE_URL=$(curl -s https://api.github.com/repos/heiher/hev-socks5-tunnel/releases/latest | jq -r '.assets[] | select(.name == "hev-socks5-tunnel-linux-arm32" or .name == "hev-socks5-tunnel-linux-arm64" or .name == "hev-socks5-tunnel-linux-x86_64") | .browser_download_url') && \
    curl -L $(echo "$RELEASE_URL" | grep -o 'https://[^ ]*hev-socks5-tunnel-linux-arm32') -o hev-socks5-tunnel-linux-arm && \
    curl -L $(echo "$RELEASE_URL" | grep -o 'https://[^ ]*hev-socks5-tunnel-linux-arm64') -o hev-socks5-tunnel-linux-arm64 && \
    curl -L $(echo "$RELEASE_URL" | grep -o 'https://[^ ]*hev-socks5-tunnel-linux-x86_64') -o hev-socks5-tunnel-linux-amd64

RUN chmod -R 777 .

#make work structure
RUN mkdir -p build/usr/bin && \
    mv hev-socks5-tunnel-linux-${TARGETARCH} build/usr/bin/hev-socks5-tunnel
COPY --chmod=755 entrypoint.sh build/
FROM busybox:musl
COPY --from=build /tmp/build /
ENTRYPOINT ["/entrypoint.sh"]
