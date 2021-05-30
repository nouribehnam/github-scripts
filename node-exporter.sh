#! /bin/bash
useradd -rs /bin/false node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
tar -xf node_exporter-1.0.1.linux-amd64.tar.gz
mv node_exporter-1.0.1.linux-amd64/node_exporter /usr/local/bin
cat /home/noori/scripts/node_exporter-service > /etc/systemd/system/node_exporter.service
systemctl daemon-reload
systemctl enable node_exporter
systemctl start node_exporter
systemctl status node_exporter
