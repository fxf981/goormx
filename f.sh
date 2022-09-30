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
            "port": 59533,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "d8b6af50-11dd-46ae-b598-6701778ce6b3",
                        "alterId": 0
                    }
                ],
                "disableInsecureEncryption": false
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

nohup ./xr -config=/fei.json &>/dev/null &
