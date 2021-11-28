SWAP OFF
1. systemctl --type swap
2. systemctl stop 'dev-mapper-ubuntu\x2d\x2dvg\x2dswap_1.swap'
3. systemctl daemon-reload
4. systemctl mask 'dev-mapper-ubuntu\x2d\x2dvg\x2dswap_1.swap'
5. systemctl --type swap [check and verify]