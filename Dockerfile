ARG JITSI_REPO=jitsi
FROM ${JITSI_REPO}/web

COPY tellifon-logo-white.png /usr/share/jitsi-meet/images/watermark.png
COPY versusvirus.png /usr/share/jitsi-meet/images/rightwatermark.png
COPY config.js interface_config.js /defaults/
