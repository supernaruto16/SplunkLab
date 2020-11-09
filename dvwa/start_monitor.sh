#!/bin/sh
$SPLUNK_HOME/bin/splunk restart
$SPLUNK_HOME/bin/splunk cmd \
        $SPLUNK_HOME/etc/apps/Splunk_TA_nix/bin/setup.sh \
        --auth admin:$SPLUNK_PASSWORD \
        --enable-all