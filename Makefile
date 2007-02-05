SCRIPTDIR = /usr/lib/dockutils
HOOKDIR = ${SCRIPTDIR}/hooks

install:
	mkdir -p ${DESTDIR}${SCRIPTDIR}
	mkdir -p ${DESTDIR}${HOOKDIR}/thinkpad
	mkdir -p ${DESTDIR}${HOOKDIR}/misc
	mkdir -p ${DESTDIR}/usr/sbin
	install docker ${DESTDIR}/usr/sbin/docker
	install common_functions ${DESTDIR}${SCRIPTDIR}
	install dockhandler ${DESTDIR}${SCRIPTDIR}
	install hooks/thinkpad/* ${DESTDIR}${HOOKDIR}/thinkpad
	mkdir -p ${DESTDIR}/etc/acpi/events
	install -m 644 config/acpid_events ${DESTDIR}/etc/acpi/events/dockutils_events

uninstall:
	rm -rf ${DESTDIR}${SCRIPTDIR}
	rm ${DESTDIR}/usr/sbin/docker
	rm ${DESTDIR}/etc/acpi/events/dockutils_events
