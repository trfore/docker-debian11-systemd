FROM debian:11
LABEL org.label-schema.author="Taylor Fore (GitHub @trfore)" \
    org.label-schema.name="docker-debian11-systemd" \ 
    org.label-schema.vcs-url="https://github.com/trfore/docker-debian11-systemd"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    procps systemd systemd-sysv sudo \
    libffi-dev libssl-dev python3 \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

RUN rm -f /lib/systemd/system/multi-user.target.wants/getty.target

STOPSIGNAL SIGRTMIN+3

VOLUME ["/sys/fs/cgroup"]
CMD ["/sbin/init"]