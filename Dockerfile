# Verwende das Alpine Basis-Image
FROM alpine:latest

# Setze Umgebungsvariablen
ENV KUBECTL_VERSION=v1.29.2

# Installiere kubectl und bereinige zwischengespeicherte Daten
RUN apk add --no-cache \
        ca-certificates \
        curl && \
    curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/ && \
    apk del curl

# Setze den Entry Point auf sh
ENTRYPOINT ["/bin/sh", "-c"]
