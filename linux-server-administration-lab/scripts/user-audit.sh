
#!/bin/bash

REPORT_DIR="reports/security"
mkdir -p "$REPORT_DIR"

REPORT_FILE="$REPORT_DIR/user-audit-$(date +%F-%H%M%S).txt"

{
    echo "LINUX USER AUDIT"
    echo "Date: $(date)"
    echo
    echo "Current User:"
    whoami
    echo
    echo "Logged-in Users:"
    who
    echo
    echo "Users with Interactive Shells:"
    awk -F: '$7 ~ /(bash|sh|zsh)$/ {
        print "User:", $1, "| Home:", $6, "| Shell:", $7
    }' /etc/passwd
    echo
    echo "Accounts with UID 0:"
    awk -F: '$3 == 0 {print $1}' /etc/passwd
} > "$REPORT_FILE"

echo "Audit report generated:"
echo "$REPORT_FILE"

