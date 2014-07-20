### ベンチマークの設定と実行

1. 起動したインスタンスの TCP 80 で Web アプリケーションが起動しています
  * 初期設定では Perl 実装が起動している状態です
  * PHP実装のみ他言語と起動方法が異なるため、`/home/isucon/webapp/php/README.md` を参照してください
  * SignInのためのテスト用アカウントは username: isucon1 password: isucon1 を使用してください
2. ベンチマークをテスト実行するためには、下記コマンドを入力してください
  
  ```
  $ sudo isucon3 test [--workload N]
  ```
  
  テスト実行の場合は、初期設定時に投入されているデータベースのデータはリセットされません
3. 本番計測を行う場合は、以下のコマンドを入力してください
  
  ```
  $ sudo isucon3 benchmark [--init /path/to/script] [--workload N]
  ```
  
  * 初期設定時と同様の状態にデータベースがリセットされます。そのため、実行開始までに数十秒程度の時間がかかります
    * データベースリセットのためには以下の条件を満たす必要があります
      * MySQL が起動している
      * user `isucon`, password なしで `isucon` データベースに接続可能
    * MySQL の `root` ユーザのパスワードは `root` です
  * `--init` 引数に任意の実行可能なコマンド(スクリプトなど)を指定することで、データベースリセット後に任意の処理を行うことができます
    * MySQL 以外のストレージにデータを移すなどの処理はここで行ってください
    * ただしコマンドの実行終了を待つのは実時間で60秒までで、それ以上経過すると強制終了されます
  * `--workload` は省略可能で、デフォルト 1 です
    * 2,3,4...と数値を増やすごとにベンチマークで掛けられる負荷が上がります
    * スコアの集計は `workload` の値によらず、表示されたものが最終結果となります

### 便利コマンドをbashrcに追加

```
cat <<EOF >> .bashrc
alias st="sudo supervisorctl status"
alias re="sudo supervisorctl restart isucon_ruby"
alias te="sudo isucon3 test --workload 1"
alias b1="sudo isucon3 benchmark --workload 1"
alias b2="sudo isucon3 benchmark --workload 2"
alias b3="sudo isucon3 benchmark --workload 3"
alias b4="sudo isucon3 benchmark --workload 4"
alias myre="sudo /etc/init.d/mysql restart"
EOF
```

