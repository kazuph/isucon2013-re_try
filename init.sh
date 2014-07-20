#!/bin/bash
echo 'CREATE INDEX'
mysql -uisucon isucon -e 'CREATE INDEX `memos_idx_is_private_created_at` ON memos (`is_private`, `created_at`);'
mysql -uisucon isucon -e 'CREATE INDEX `memos_idx_user_created_at` ON memos (`user`, `created_at`);'
# DELETE FROM public_memos WHERE id > 20540;
# ALTER TABLE public_memos AUTO_INCREMENT = 20541;

