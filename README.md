# Old SlackBuilds

This repository contains SlackBuilds that were part of a proof-of-concept migration study for Slackware Linux. As of
9/21/2021, this study has concluded, and another distribution has been selected. Consequently, these builds are not
likely to be updated. In addition, the effort to develop a build system has been abandoned.


## Info File Format

The .info files found in this repository follow a superset of the format used on [SlackBuilds.org](https://slackbuilds.org).

The format differences are:

1. The addition of a GPG key, which lists (using whitespace separation) the GPG detached signature files
   used for each DOWNLOAD entry (with GPG\_x86\_64 tracking DOWNLOAD\_x86\_64). When GPG signatures are available,
   they are used for source verification, instead of the MD5SUM (and MD5SUM\_x86\_64) entries.
2. If GPG signatures are available, the GPG\_KEY key is populated with either a whitespace-separated list of GPG
   public keys used for signature checking, or the GPG public keys verbatim. The .info file is treated as a Bash
   script, which permits multiline strings. If there are multiple source files signed using a single GPG key, only
   one public key needs to be provided here.
3. Source files in the DOWNLOAD and DOWNLOAD\_x86\_64 entries may be renamed upon download by prefixing them with
   the base filename, followed by two colons (::), followed by the URL (no spaces in any single download entry).

