#!/bin/bash
echo 'CREATE INDEX'
mysql -uisucon isucon -e 'CREATE INDEX idx_created_at ON memos(created_at);'
