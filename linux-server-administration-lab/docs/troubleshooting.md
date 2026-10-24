
# Linux Troubleshooting Journal

## Problem
Nginx service failed to start.

## Symptoms
The service status showed a failure.

## Investigation
Checked the service and configuration:
systemctl status nginx
sudo nginx -t
sudo journalctl -u nginx --since today

## Root Cause
Write the actual cause discovered.

## Solution
Write the commands used to fix the issue.

## Verification
Explain how you confirmed the service was working.

## Prevention
Describe how to prevent the same issue.

