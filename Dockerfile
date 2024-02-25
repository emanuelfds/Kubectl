FROM alpine

LABEL Description="Kubernetes tools for EKS - Emanuel Fernandes"

# Ignore to update versions here
# docker build --no-cache --build-arg KUBECTL_VERSION=${tag} --build-arg HELM_VERSION=${helm} --build-arg KUSTOMIZE_VERSION=${kustomize_version} -t ${image}:${tag} .
ARG KUBECTL_VERSION=1.29.2

# Install curl
RUN apk add --update --no-cache curl

# Install kubectl
RUN curl -sLO https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl

ENTRYPOINT [ "kubectl"]
