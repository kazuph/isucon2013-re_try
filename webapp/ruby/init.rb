#!/usr/bin/env ruby
require 'mysql2-cs-bind'
require 'json'
require 'dalli'

config = JSON.parse(IO.read(File.dirname(__FILE__) + "/../config/#{ ENV['ISUCON_ENV'] || 'local' }.json"))['database']

mysql = Mysql2::Client.new(
:host => config['host'],
:port => config['port'],
:username => config['username'],
:password => config['password'],
:database => config['dbname'],
:reconnect => true,
)
total = mysql.xquery('SELECT count(*) AS c FROM memos WHERE is_private=0').first["c"]
dc = Dalli::Client.new('localhost:11212')
dc.set("memos_total_private_0", total, 0, :raw => true)

puts "total memos: #{total}"
puts "get total: #{dc.get("memos_total_private_0")}"
