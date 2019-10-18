FROM selenium/standalone-chrome-debug:3.141.59-vanadium

USER root

RUN apt-get update -qqy \
  && apt-get -qqy install xdotool \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*


COPY selenium.conf /etc/supervisor/conf.d/

COPY wait-for-x.sh /opt/bin/wait-for-x.sh

USER seluser
