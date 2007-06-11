SCRIPTDIR = /usr/lib/dockutils
HOOKDIR = ${SCRIPTDIR}/hooks
PM_UTILS_HOOKDIR=/usr/lib/pm-utils/sleep.d

install:
	mkdir -p ${DESTDIR}${SCRIPTDIR}
	mkdir -p ${DESTDIR}${HOOKDIR}/thinkpad
	mkdir -p ${DESTDIR}${HOOKDIR}/misc
	mkdir -p ${DESTDIR}/usr/sbin
	install docker ${DESTDIR}/usr/sbin/docker
	install common_functions ${DESTDIR}${SCRIPTDIR}
	install dockhandler ${DESTDIR}${SCRIPTDIR}
	install hooks/thinkpad/* ${DESTDIR}${HOOKDIR}/thinkpad
	mkdir -p ${DESTDIR}${PM_UTILS_HOOKDIR}
	install misc/24dock ${DESTDIR}${PM_UTILS_HOOKDIR}
	mkdir -p ${DESTDIR}/etc/acpi/events
	install -m 644 config/acpid_events ${DESTDIR}/etc/acpi/events/dockutils_events

uninstall:
	rm -rf ${DESTDIR}${SCRIPTDIR}
	rm ${DESTDIR}/usr/sbin/docker
	rm ${DESTDIR}/etc/acpi/events/dockutils_events
	rm -f ${DESTDIR}${PM_UTILS_HOOKDIR}/24dock
	rmdir -p --ignore-fail-on-non-empty ${DESTDIR}${PM_UTILS_HOOKDIR}
