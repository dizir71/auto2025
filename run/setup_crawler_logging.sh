
#!/bin/bash

CRAWLER_DIR="/run/suv_crawler"
LOG_FILE="/var/log/suv_crawler.log"

# Ensure log file exists and has correct permissions
mkdir -p "$(dirname $LOG_FILE)"
touch $LOG_FILE
chmod 644 $LOG_FILE

# Setup logging for crawler script (append log instructions to main crawler script)
if ! grep -q "exec > >(tee -a $LOG_FILE)" "$CRAWLER_DIR/suv_crawler.sh"; then
  echo "Adding logging to $CRAWLER_DIR/suv_crawler.sh"
  sed -i '1s|^|exec > >(tee -a $LOG_FILE) 2>&1\n|' "$CRAWLER_DIR/suv_crawler.sh"
fi

echo "Logging setup completed for $CRAWLER_DIR"
