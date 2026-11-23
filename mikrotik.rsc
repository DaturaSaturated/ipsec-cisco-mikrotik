# RouterOS. Внешние адреса заменены на TEST-NET, общий ключ скрыт.
/ip ipsec profile add name=ikev2_profile dh-group=modp2048 enc-algorithm=aes-256 hash-algorithm=sha256
/ip ipsec peer add address=192.0.2.6/32 exchange-mode=ike2 profile=ikev2_profile name=cisco_peer
/ip ipsec identity add peer=cisco_peer auth-method=pre-shared-key secret="<SHARED_KEY>"
/ip ipsec proposal add name=ikev2_proposal auth-algorithms=sha256 enc-algorithms=aes-256-cbc pfs-group=modp2048
/ip ipsec policy add src-address=192.168.15.0/24 dst-address=10.1.1.0/24 sa-dst-address=192.0.2.6 sa-src-address=192.0.2.5 tunnel=yes proposal=ikev2_proposal peer=cisco_peer
