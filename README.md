# Tunnel to socks5 container (arm/arm64/amd64).

****
### ENV for MikroTik ROS
****
```
/container envs
add key=SOCKS5_ADDR name=tun_envs value=172.16.0.1 comment="IP address socks5 server"
add key=SOCKS5_PORT name=tun_envs value=1080 comment="Port socks5 server, default 1080"
add key=SOCKS5_UDP_MODE name=tun_envs value=udp comment="udp or tcp for udp mode default udp"
add key=IPV4 name=tun_envs value=198.18.0.1 comment="internal IP address tun interface default 198.18.0.1"
add key=IPV4_INCLUDED_ROUTES name=tun_envs value=0.0.0.0/0 comment="include all IPV4 address"
add key=IPV4_EXCLUDED_ROUTES name=tun_envs value=192.168.0.0/16,10.10.0.0/16 comment="add veth netwok and LAN"
add key=MARK name=tun_envs value=0x1a comment="MARK SOCKET"
add key=MTU name=tun_envs value=9000 comment="MTU"
add key=SOCKS5_USERNAME name=tun_envs value=USER comment="User name for autorized mode"
add key=SOCKS5_PASSWORD name=tun_envs value=PASSWORD comment="Password for autorized mode"
add key=LOG_LEVEL name=tun_envs value=warn comment="set log level may be (info,debug,warn,error)"
```
****
```
add key=IPV6 name=tun_envs value=fc00::1 comment="internal IPV6 address tun interface
add key=IPV6_INCLUDED_ROUTES name=tun_envs value=::/0 comment="include all IPV6 address"
add key=IPV6_EXCLUDED_ROUTES name=tun_envs value= comment=fe80::/64 "exlude local IPV6 address"
```
****

