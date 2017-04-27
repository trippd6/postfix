FROM centos:7

RUN yum -y update && \
   yum -y install epel-release && \
   rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 && \
   yum -y install python34-devel postfix telnet net-tools && \
   yum clean all

RUN curl https://bootstrap.pypa.io/get-pip.py | python3.4 && \
    pip3 install chaperone

RUN mkdir -p /etc/chaperone.d && touch /etc/postfix/transport
COPY chaperone.conf /etc/chaperone.d/chaperone.conf

EXPOSE 25

ENTRYPOINT ["/usr/bin/chaperone"]
