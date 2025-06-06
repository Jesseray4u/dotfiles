#!/data/data/com.termux/files/usr/bin/bash

DB_PATH="$HOME/dotfiles/db/sync_logs.db"
CSV_PATH="$HOME/dotfiles/db/sync_logs_export.csv"

if [ ! -f "$DB_PATH" ]; then
  echo "❌ Database not found at $DB_PATH"
  exit 1
fi

sqlite3 -header -csv "$DB_PATH" "SELECT * FROM sync_logs ORDER BY timestamp DESC;" > "$CSV_PATH"

if [ -f "$CSV_PATH" ]; then
  echo "✅ Export complete: $CSV_PATH"
else
  echo "❌ Export failed"
fi
