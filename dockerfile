FROM google/cloud-sdk:325.0.0-alpine

ENV HELM_VERSION v3.4.1
ENV KUBE_LATEST_VERSION v1.17.0
ENV YAML_BIN_VERSION="3.2.1"

RUN wget https://storage.googleapis.com/kubernetes-release/release/$KUBE_LATEST_VERSION/bin/linux/amd64/kubectl && \
    mv kubectl /usr/local/bin/ && \
    chmod +x /usr/local/bin/kubectl && \
    wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm && \
    chmod +x /usr/local/bin/helm && \
    apk update && \
    apk add jq make && \
    wget -O /usr/local/bin/yq "https://github.com/mikefarah/yq/releases/download/${YAML_BIN_VERSION}/yq_linux_amd64" && \
    chmod +x /usr/local/bin/yq && \
    rm -rf /var/cache/apk/*