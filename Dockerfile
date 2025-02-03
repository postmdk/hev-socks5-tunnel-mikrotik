FROM ghcr.io/heiher/hev-socks5-tunnel

COPY --chown=0:0 --chmod=755 entrypoint.sh /entrypoint.sh
