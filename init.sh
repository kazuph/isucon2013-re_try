#!/bin/bash
mysql -uisucon isucon -e 'CREATE INDEX `memos_idx_is_private_created_at` ON memos (`is_private`, `created_at`);' >> /home/isucon/init.log 2>&1
mysql -uisucon isucon -e 'CREATE INDEX `memos_idx_user_created_at` ON memos (`user`, `created_at`);' >> /home/isucon/init.log 2>&1

cd /home/isucon/webapp/ruby
/home/isucon/env.sh bundle exec ruby init.rb >> /home/isucon/init.log 2>&1
