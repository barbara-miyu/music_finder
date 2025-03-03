# 開発環境構築手順
## 前提
DockerDesktopが既にインストール済みであること。

## 環境変数の設定
ルートディレクトリ直下の「.env.example」を「.env」に書き換える。
<br>.env.example ⇒ .env
<br>※値を変えることで、DB周りの設定変更等が可能

## Dockerコンテナの立ち上げ
1. プロジェクトのルートディレクトリでコンテナのイメージを生成する。（以降、dockerコマンドはdocker-compose.ymlが存在するルートディレクトリで実行すること）
<br>・docker compose build　　

2. イメージ生成後、コンテナを立ち上げる。
<br>・docker compose up -d

## migrationファイルを実行しテーブルを生成
1. Rubyアプリケーションのコンテナに入る。
<br>・docker compose exec web bash

2. bin/railsにファイルの実行権限を付与する。
<br>・chmod +x bin/rails

3. コンテナ環境で実行するため、ruby.exeの改行コードをLFに変更する。
<br>・bin/railsを開き、右下の「CRLF」を「LF」に変更

4. migrationファイルを実行する。
<br>・bin/rails db:migrate RAILS_ENV=development

## Webpackの設定
1. bin/webpack及びbin/webpack-dev-serverに実行権限を付与する。
<br>・chmod +x bin/webpack
<br>・chmod +x bin/webpack-dev-server

2. コンテナ環境で実行するため、「webpack」及び「webpack-dev-server」の改行コードをLFに変更する。
<br>・bin/webpack及びbin/webpack-dev-serverを開き、右下の「CRLF」を「LF」に変更

3. webpackの開発サーバーを起動させる。
<br>・bin/webpack-dev-server