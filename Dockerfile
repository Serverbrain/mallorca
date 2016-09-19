FROM debian:jessie
MAINTAINER Serverbrain
COPY callorca /orca/callorca
COPY mallorca /orca/mallorca
COPY orca.sh /orca/orca.sh
CMD /orca/orca.sh 128 15 /orca/callorca
