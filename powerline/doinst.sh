#!/bin/sh

ln -s ../conf.avail/10-powerline-symbols.conf /etc/fonts/conf.d/10-powerline-symbols.conf
fc-cache
