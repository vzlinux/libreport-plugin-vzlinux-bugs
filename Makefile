INSTALL = install
MKDIR_P = mkdir -p

default:

install: src/reporter-vz-bugs man/reporter-vzlinux-bugs.1 man/vzlinux_bugs_event.conf.5 etc/vzlinux_bugs_event.conf workflows/workflow_AnacondaVzLinuxBugzilla.xml events/report_VzLinuxBugzilla.xml
	$(MKDIR_P) $(DESTDIR)/etc/libreport/events.d/
	$(MKDIR_P) $(DESTDIR)/usr/share/man/man5/
	$(MKDIR_P) $(DESTDIR)/usr/share/man/man1/
	$(MKDIR_P) $(DESTDIR)/usr/bin/
	$(MKDIR_P) $(DESTDIR)/usr/share/libreport/events
	$(MKDIR_P) $(DESTDIR)/usr/share/libreport/workflows

	$(INSTALL) -Dm 644 etc/vzlinux_bugs_event.conf $(DESTDIR)/etc/libreport/events.d/
	$(INSTALL) -Dm 644 man/vzlinux_bugs_event.conf.5 $(DESTDIR)/usr/share/man/man5/
	$(INSTALL) -Dm 644 man/reporter-vzlinux-bugs.1 $(DESTDIR)/usr/share/man/man1/
	$(INSTALL) -Dm 755 src/reporter-vzlinux-bugs $(DESTDIR)/usr/bin/
	$(INSTALL) -Dm 644 events/report_VzLinuxBugzilla.xml $(DESTDIR)/usr/share/libreport/events/
	$(INSTALL) -Dm 644 workflows/workflow_AnacondaVzLinuxBugzilla.xml $(DESTDIR)/usr/share/libreport/workflows/

.PHONY: default install
