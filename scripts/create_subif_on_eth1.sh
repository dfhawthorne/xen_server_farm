#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Create subinterfaces on eth1
# ------------------------------------------------------------------------------
cd /etc/sysconfig/network-scripts
for subif in 1 2 3
do
    bridge=${subif}
    ifname="eth1:${subif}"
    bridgename="xenbr${bridge}"
    # ==== Create subinterface
    cat <<DONE >ifcfg-${ifname}
# -----------------------------------------------------------------------------
# Sub-interface #${subif} on eth1 to support bridge ${bridgename}
# Generated $(date +"%F %T")
# -----------------------------------------------------------------------------
# Device identification
DEVICE="${ifname}"
UUID="$(uuidgen)"
$(grep HWADDR ifcfg-eth1)
# Device options
ONPARENT="yes"
TYPE="Ethernet"
MTU="9000"
ONBOOT="yes"
NM_CONTROLLED="no"
# Bridge
BRIDGE="${bridgename}"
DONE
done 
