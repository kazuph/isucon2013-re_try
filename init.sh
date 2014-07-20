#!/bin/bash
echo 'CREATE INDEX'
mysql -uisucon isucon -e 'CREATE INDEX `memos_idx_is_private_created_at` ON memos (`is_private`, `created_at`);'
mysql -uisucon isucon -e 'CREATE INDEX `memos_idx_user_created_at` ON memos (`user`, `created_at`);'

