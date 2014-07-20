#!/bin/bash
echo 'CREATE INDEX'
# mysql -uisucon isucon -e 'CREATE INDEX `memos_idx_is_private_created_at` ON memos (`is_private`, `created_at`);'
# mysql -uisucon isucon -e 'CREATE INDEX `memos_idx_user_created_at` ON memos (`user`, `created_at`);'
mysql -uisucon isucon -e 'CREATE INDEX `memos_idx_id_user_is_private_created_at` ON memos (`user`, `is_private`);'
mysql -uisucon isucon -e 'CREATE INDEX `memos_idx_id_user` ON memos (`user`);'
# DELETE FROM public_memos WHERE id > 20540;
# ALTER TABLE public_memos AUTO_INCREMENT = 20541;

cd /home/isucon/webapp/ruby/
/home/isucon/env.sh bundle exec ruby init.rb
