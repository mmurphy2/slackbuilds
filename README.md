# Dr. Murphy's CCU SlackBuilds

This repository contains SlackBuilds for packages created for the upcoming
[Slackware Linux](http://www.slackware.com) 15.0 release. Currently, builds
are hosted only for the x86\_64 architecture.

The resulting binary packages are available at:
[https://mirror.coastal.edu/tealrepo/mmurphy2/15.0/](https://mirror.coastal.edu/tealrepo/mmurphy2/15.0).

## Info File Format

The .info files found in this repository follow a superset of the format used on [SlackBuilds.org](https://slackbuilds.org).

Although we're still developing our build system, the current format differences are:

1. The addition of a GPG key, which lists (using whitespace separation) the GPG detached signature files
   used for each DOWNLOAD entry (with GPG\_x86\_64 tracking DOWNLOAD\_x86\_64). When GPG signatures are available,
   they are used for source verification, instead of the MD5SUM (and MD5SUM\_x86\_64) entries.
2. If GPG signatures are available, the GPG\_KEY key is populated with either a whitespace-separated list of GPG
   public keys used for signature checking, or the GPG public keys verbatim. The .info file is treated as a Bash
   script, which permits multiline strings. If there are multiple source files signed using a single GPG key, only
   one public key needs to be provided here.
3. Source files in the DOWNLOAD and DOWNLOAD\_x86\_64 entries may be renamed upon download by prefixing them with
   the base filename, followed by two colons (::), followed by the URL (no spaces in any single download entry).

At this time, we have not yet released our build system but expect to do so under an open source license later in
2021. Other build systems, such as those for SlackBuilds.org ports, may not be able to use the .info files in this
repository without a bit of editing first.
