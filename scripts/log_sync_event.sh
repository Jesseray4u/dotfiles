#!/data/data/com.termux/files/usr/bin/bash

# CONFIG
DB_PATH="$HOME/dotfiles/db/sync_logs.db"
SCHEMA="$HOME/dotfiles/db/sync_logger_schema.sql"
DEVICE_NAME=$(getprop ro.product.model 2>/dev/null || echo "UnknownDevice")

# Ensure DB exists
if [ ! -f "$DB_PATH" ]; then
    echo "📦 Initializing database..."
    sqlite3 "$DB_PATH" < "$SCHEMA"
fi

# Log arguments
ACTION="$1"
STATUS="$2"
DETAILS="$3"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Insert into database
sqlite3 "$DB_PATH" <<EOF
INSERT INTO sync_logs (timestamp, device, action, status, details)
VALUES ("$TIMESTAMP", "$DEVICE_NAME", "$ACTION", "$STATUS", "$DETAILS");
EOF

echo "✅ Log recorded: $TIMESTAMP | $DEVICE_NAME | $ACTION | $STATUS"
