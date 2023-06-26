#!/bin/bash
cp -Rn /opt/linbpq-install/* /opt/linbpq
cp -u /opt/linbpq-install/linbpq /opt/linbpq
chmod +x /opt/linbpq/linbpq
cd /opt/linbpq
./linbpq
