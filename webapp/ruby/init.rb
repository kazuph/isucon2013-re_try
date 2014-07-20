#!/usr/bin/env ruby
require 'json'
require 'mysql2-cs-bind'
require 'dalli'
require 'pp'

config = JSON.parse(IO.read(File.dirname(__FILE__) + "/../config/#{ ENV['ISUCON_ENV'] || 'local' }.json"))['database']
mysql = Mysql2::Client.new(
:host => config['host'],
:port => config['port'],
:username => config['username'],
:password => config['password'],
:database => config['dbname'],
:reconnect => true,
)

mysql.xquery('DELETE FROM public_memos;')
mysql.xquery('ALTER TABLE public_memos AUTO_INCREMENT = 0;')
p memos = mysql.query("SELECT id FROM memos WHERE is_private=0 ORDER BY id;").map{|o|o['id']}
memos.each do |id|
  mysql.xquery( 'INSERT INTO public_memos (memo) VALUES (?)', id)
end
puts "mysqlの最後のIDは#{mysql.last_id}"
