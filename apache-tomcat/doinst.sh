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

# Keep same perms on rc.tomcat.new:
if [ -e etc/rc.d/rc.tomcat ]; then
  cp -a etc/rc.d/rc.tomcat etc/rc.d/rc.tomcat.new.incoming
  cat etc/rc.d/rc.tomcat.new > etc/rc.d/rc.tomcat.new.incoming
  mv etc/rc.d/rc.tomcat.new.incoming etc/rc.d/rc.tomcat.new
fi

config etc/rc.d/rc.tomcat.new

if ! id tomcat >/dev/null 2>/dev/null; then
    echo "Before starting the tomcat server, you must create a dedicated user"
    echo "# groupadd -g 232 tomcat"
    echo "# useradd -u 232 -g tomcat -d /var/lib/tomcat -s /bin/false tomcat"
fi
