#!/bin/sh

REPOSITORY=$(echo "${1}" | tr '[:upper:]' '[:lower:]')
MIRROR_PATH=/backup/mirrors


dl_openbsd()
{
	# Get OpenBSD repositories
	/usr/local/bin/cvsync -qc "${MIRROR_PATH}/cvs-syncfile"
}

dl_netbsd()
{
	# Get NetBSD repositories
	/usr/local/bin/rsync -avz rsync://rsync.fr.NetBSD.org/NetBSD-CVS/ "${MIRROR_PATH}/netbsd-cvs/"
}

dl_dragonflybsd()
{
	# Get DragonFlyBSD repositories
	(cd "${MIRROR_PATH}/dragonfly" && git pull)
}

dl_freebsd()
{
	# Get FreeBSD repository
	svnsync sync "file://$MIRROR_PATH/freebsd-src/base/"
}

if [[ "${REPOSITORY}" == "openbsd" ]]; then
	echo OpenBSD
	dl_openbsd
elif [[ "${REPOSITORY}" == "netbsd" ]]; then
	echo NetBSD
	dl_netbsd
elif [[ "${REPOSITORY}" == "dragonflybsd" ]]; then
	echo DragonflyBSD
	dl_dragonflybsd
elif [[ "${FreebSD}" == "freebsd" ]]; then
	echo FreeBSD
	dl_freebsd
else
	echo All

	dl_openbsd
	dl_netbsd
	dl_dragonflybsd
	dl_freebsd
fi
