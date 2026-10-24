
#!/bin/bash

echo "Disk Usage Report"
echo "================="
df -h

echo
echo "Filesystem Usage Percentage"
df -P | awk 'NR > 1 {
    gsub("%", "", $5)
    if ($5 >= 80) {
        print "WARNING:", $6, "is", $5 "% full"
    }
}'

