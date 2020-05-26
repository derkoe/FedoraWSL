FROM library/fedora:32

COPY Zscaler-Root.crt /etc/pki/ca-trust/source/anchors/

RUN update-ca-trust \
 && dnf update -y \
 && dnf module install nodejs:12 -y \
 && dnf install -y bzip2 cascadia-code-fonts git java-1.8.0-openjdk-devel java-1.8.0-openjdk-src java-11-openjdk-devel java-11-openjdk-src make maven tar unzip wget x2goserver x2goserver-xsession zip \
 && dnf clean all && rm -rf /var/cache/dnf \
 && pwconv && grpconv && chmod 0744 /etc/shadow && chmod 0744 /etc/gshadow
