FROM vulnerables/web-dvwa:latest

COPY splunk_apps/splunkforwarder.deb /tmp
RUN dpkg -i /tmp/splunkforwarder.deb && \
    rm -f /tmp/splunkforwarder.deb

ENV SPLUNK_PASSWORD="splunk123@"
ENV SPLUNK_HOME='/opt/splunkforwarder'
RUN $SPLUNK_HOME/bin/splunk start --accept-license --no-prompt --seed-passwd $SPLUNK_PASSWORD && \
    $SPLUNK_HOME/bin/splunk add forward-server splunk:9997 -auth admin:$SPLUNK_PASSWORD

ADD splunk_apps/splunk-add-on-for-unix-and-linux_820.tgz $SPLUNK_HOME/etc/apps
ENV WAIT_HOSTS=splunk:9997
COPY dvwa/start_monitor.sh /start_monitor.sh

RUN chmod +x /start_monitor.sh