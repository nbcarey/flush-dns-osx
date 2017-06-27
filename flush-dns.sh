#!/usr/bin/env bash
set -o errexit
set -o pipefail

#------------------------------------------------------------------
# this script MUST be run as root. If they're not root (EUID of 0),
# recursively invoke ourselv with sudo(1).
#------------------------------------------------------------------
if [ $EUID -ne 0 ]; then
    sudo "$0" $@
    exit
fi;

#------------------------------------------------------------------
# if we get here, we're running as root
#------------------------------------------------------------------

fail() {
    echo ERROR: $*
    return 1
}

is_darwin() {
    local -r system_name=`uname -s`

    if [ "$system_name" == 'Darwin' ];
    then return 0;
    else return 1;
    fi;

}

is_osx() {
    local -r os_name=`sw_vers -productName`

    if [ "$os_name" == 'Mac OS X' ];
    then return 0;
    else return 1;
    fi;

}

main() {

    # if this isn't Darwin, no point in continuing
    if ! is_darwin; then
        fail "System is not OS X";
    fi;

    if ! is_osx; then
        fail "System is not OS X";
    fi;

    local -r osx_version=`sw_vers -productVersion`;

    echo "Flushing DNS Cache for OSX v${osx_version} ..."

    case "$osx_version" in
    10.[34].*) # Panther, Tiger
        lookupd -flushcache
        ;;
    10.[56].*) # Leopard, Snow Leopard
        dscacheutil -flushcache
        ;;
    10.[789].*) # OS X Lion, Mountain Lion and Mavericks
        dscacheutil -flushcache
        killall -HUP mDNSResponder
        ;;
    10.10.[0123]) # OS X Yosemite
        discoveryutil mdnsflushcache
        discoveryutil udnsflushcache
        ;;
    10.10.[45]) # OS X Yosemite
        dscacheutil -flushcache
        killall -HUP mDNSResponder
        ;;
    10.11.*) # OS X El Capitan
        dscacheutil -flushcache
        killall -HUP mDNSResponder
        ;;
    10.12.*) # OS X Sierra
        dscacheutil -flushcache
        killall -HUP mDNSResponder
        ;;
    *)
        fail "${osx_version}: Unknown OS X version"
        ;;
    esac

    echo "...flushed"

}

main $@;
