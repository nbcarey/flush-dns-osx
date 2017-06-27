# flush-dns-osx

Shell script to flush the DNS cache for various flavors of OS X

## Usage

    flush-dns

## Installation

Installing and uninstalling this is easy. Just download the latest release from https://github.com/nbcarey/flush-dns-osx/releases. The easiest way to unpack it is via the finder. Just double-click on the `*.zip` or `*.tar.gz` file and let the Finder do its thing.

Then open a command shell, `cd` down to the unpacked directory and run

- `sudo make install` to install it, or
- `sudo make uninstall` to uninstall it.

If you don't have `make` installed, you need to run these commands to install it:

    sudo cp ./flush-dns.sh /usr/local/bin/flush-dns
    sudo chmod 0755 /usr/local/bin/flush-dns
    sudo chown root:wheel /usr/local/bin/flush-dns

To remove it:

    sudo rm /usr/local/bin/flush-dns

## References

- http://osxdaily.com/2008/03/21/how-to-flush-your-dns-cache-in-mac-os-x/
- http://osxdaily.com/2014/11/20/flush-dns-cache-mac-os-x/
- http://osxdaily.com/2015/11/16/howto-flush-dns-cache-os-x-elcap/
- http://osxdaily.com/2017/03/08/clear-dns-cache-macos-sierra/
