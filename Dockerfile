FROM ubuntu:precise

MAINTAINER Michal Cichra <michal@3scale.net> # 2014-06-11

# non interactive apt
ENV DEBIAN_FRONTEND noninteractive

RUN apt-mark hold initscripts udev plymouth mountall \
 && dpkg-divert --local --rename --add /sbin/initctl \
 && ln -sf /bin/true /sbin/initctl \
 && dpkg-divert --local --rename /usr/bin/ischroot \
 && ln -sf /bin/true /usr/bin/ischroot \
 && echo "exit 101" > /usr/sbin/policy-rc.d \
 && chmod +x /usr/sbin/policy-rc.d \
 && echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup \
 && echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache \
 && echo 'APT {Install-Recommends="false";Install-Suggests="false";};' > /etc/apt/apt.conf.d/no-recommends \
 && rm /etc/cron.daily/apt \
 && rm /etc/cron.daily/dpkg \
 && rm /etc/cron.daily/passwd

ADD apt-install /usr/local/bin/
ENV NUM_CPU grep -c processor /proc/cpuinfo

# Do not apt-get update here as the downloaded lists would be part of the image
