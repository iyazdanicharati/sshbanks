#!/bin/bash
mysqldump -uicsystem -pPoorboys0604@@ tester > /var/www/.cmds/bk/t1_$(date '+%Y%m%d_%H%M%S').sql
echo "is=> " $(date '+%Y-%m-%d %H:%M:%S') >> /var/www/.cmds/test.txt