cd /etc/sysconfig/network-scripts
for bridge in 0 1 2 3
do
    nw=$(((bridge + 1)))
    bridgename="xenbr${bridge}"
    # ==== Create bridge
    cat <<DONE >ifcfg-${bridgename}
# -----------------------------------------------------------------------------
# Bridge ${bridgename}
# Generated $(date +"%F %T")
# -----------------------------------------------------------------------------
# Device identification
DEVICE="${bridgename}"
UUID="$(uuidgen)"
# Device options
BOOTPROTO="static"
TYPE="Bridge"
ONBOOT="yes"
DELAY="0"
NM_CONTROLLED="no"
# IPV4 Networking
IPADDR="192.168.${nw}.100"
NETMASK="255.255.255.0"
GATEWAY="192.168.1.1"
# DNS
DNS1="192.168.1.252"
DNS2="192.168.1.1"
PEERDNS="yes"
DOMAIN="yaocm.id.au"
DONE
done 
