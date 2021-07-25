FROM gentoo/portage:latest as portage

FROM gentoo/stage3:amd64-systemd

COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

RUN mkdir -p /etc/portage/package.use && \
	echo "sys-apps/util-linux caps" > /etc/portage/package.use/pfl && \
	emerge dev-vcs/git app-editors/vim && \
	emerge --onlydeps app-portage/pfl && \
	rm -rf /var/db/repos/gentoo

