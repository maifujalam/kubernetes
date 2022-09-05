#!/bin/bash
LOG_FILE="/usr/local/hotfix0_log.log"
output=$(journalctl -u kubelet -n 1 | grep "Failed")
if [[ $? != 0 ]]; then
  echo "$(date) - kubelet working." >> ${LOG_FILE}
elif [[ ${output} ]]; then
  echo "$(date) - error in kubelet. Restarting kubelet." >> ${LOG_FILE}
  systemctl restart kubelet
fi