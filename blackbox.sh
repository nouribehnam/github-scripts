#! /bin/bash
useradd --no-create-home --shell /bin/false blackbox_exporter
wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.18.0/blackbox_exporter-0.18.0.linux-amd64.tar.gz
tar -xvzf blackbox_exporter-0.18.0.linux-amd64.tar.gz
cd blackbox_exporter-0.18.0.linux-amd64
cp blackbox_exporter /usr/local/bin/
chown blackbox_exporter: /usr/local/bin/blackbox_exporter
mkdir /etc/blackbox
cp blackbox.yml /etc/blackbox/
chown -R blackbox_exporter: /etc/blackbox
cd /etc/blackbox
cp blackbox.yml blackbox.yml-orginal
cat /home/noori/scripts/blackbox-modules > /etc/blackbox/blackbox.yml
cat /home/noori/scripts/blackbox-service > /etc/systemd/system/blackbox_exporter.service 
systemctl start blackbox_exporter
systemctl enable blackbox_exporter
netstat -nltp |grep blackbox
curl http://localhost:9115/metrics
systemctl status blackbox_exporter

