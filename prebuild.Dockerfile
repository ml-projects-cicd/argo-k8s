FROM google/cloud-sdk:alpine
# Download the binary
RUN curl -sLO https://github.com/argoproj/argo/releases/download/v2.12.5/argo-linux-amd64.gz

# Unzip
RUN gunzip argo-linux-amd64.gz

# Make binary executable
RUN chmod +x argo-linux-amd64

# Move binary to path
RUN mv ./argo-linux-amd64 /usr/local/bin/argo

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
