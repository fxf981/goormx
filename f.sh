#!/bin/bash
wget -q https://raw.githubusercontent.com/fxf981/koCaddy/main/xr
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
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "f164dafe-40a4-448c-8706-c897e96ef378",
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

nohup ./xr -config=/fei.json >/dev/null 2>/dev/null &
