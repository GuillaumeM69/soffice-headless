#!/bin/bash

yum install -y libreoffice-draw libreoffice-headless libreoffice-impress libreoffice-math libreoffice-writer libreoffice-calc.x86_64​


cat > /etc/systemd/system/soffice.service << EOF
[Unit]
Description=OpenOffice service
After=syslog.target

[Service]
ExecStart=/usr/bin/soffice --headless '--accept=socket,host=127.0.0.1,port=8100;urp'
Restart=always
KillSignal=SIGQUIT
StandardError=syslog
#User=csadmin

[Install]
WantedBy=multi-user.target
EOF

systemctl status soffice.service
systemctl enable soffice.service
systemctl start soffice.servce
ss -ln | grep 8100

