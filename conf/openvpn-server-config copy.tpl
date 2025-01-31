management 0.0.0.0 2080

port {{ .Port }}
proto {{ .Proto }}

dev tun

ca {{ .Ca }}
cert {{ .Cert }}
key {{ .Key }}

cipher {{ .Cipher }}
keysize {{ .Keysize }}
auth {{ .Auth }}
dh {{ .Dh }}

server 10.0.70.0 255.255.255.0
route 10.0.71.0 255.255.255.0
ifconfig-pool-persist {{ .IfconfigPoolPersist }}
push "route 10.0.60.0 255.255.255.0"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"

keepalive {{ .Keepalive }}
comp-lzo
max-clients {{ .MaxClients }}

persist-key
persist-tun

log         /var/log/openvpn/openvpn.log
verb 4
topology subnet
route 10.0.71.0 255.255.255.0

client-config-dir /etc/openvpn/staticclients
push "redirect-gateway def1 bypass-dhcp"

ncp-ciphers AES-256-GCM:AES-192-GCM:AES-128-GCM

user nobody
group nogroup

status /var/log/openvpn/openvpn-status.log
explicit-exit-notify 1
crl-verify pki/crl.pem

#auto generated

