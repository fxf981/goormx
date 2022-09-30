#!/bin/bash
wget -N https://raw.githubusercontent.com/fxf981/koCaddy/main/xr
chmod +x xr
# Set config file
cat <<EOF >/fei.json
{
    "log": {
        "loglevel": "none"
    },
    "inbounds": [
        {
            "listen": "0.0.0.0",
            "port": 9999,
            "protocol": "Shadowsocks",
            "settings": {
                "clients": [
                    {
                    "password": "goorm",
                    "method": "aes-128-gcm"
                    }
                ],
            },
            "streamSettings": {
                "network": "ws"
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF

nohup ./xr -config=/fei.json >/dev/null 2>/dev/null &
