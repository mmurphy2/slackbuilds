config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

config /usr/src/system76-@VERSION@/dkms.conf.new
/usr/sbin/dkms add -m system76 -v @VERSION@
/usr/sbin/dkms build -m system76 -v @VERSION@
/usr/sbin/dkms install -m system76 -v @VERSION@

