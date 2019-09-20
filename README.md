
# BlueLog

スキューバダイビングの記録をつけるアプリです。

## 説明

ダイビングをした後には必ずログ（記録）をつけます。  
ログをデータ化して、Webで管理したいという思いからこのアプリを作りました。  
ログの作成や編集、他ユーザーのログを閲覧できます。  
![BlueLog](https://gyazo.com/8b36b52fbb7b7500a3ede8ae98252f5d.png)
## 使い方

下記URLにアクセスし、テスト用アカウントでログインします。  
ログの作成や、好きなユーザーのログを閲覧できます。

- 接続先情報  
URL https://bluelog2.herokuapp.com/
- テスト用アカウント  
メールアドレス: manbow@jkjk.com  
パスワード: manbow42

Chromeの最新版を利用してアクセスしてください。  
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続ください。  
同時に複数の方がログインしている場合に、ログインできない可能性がございます。  
確認後、ログアウト処理をお願いします。


## 機能

- ユーザー登録・ログイン機能
- ユーザー編集機能
- ユーザー詳細ページ
- ログ一覧機能
- ログ投稿機能
- ログ編集機能
- ログ削除機能
- 画像投稿機能（ActiveStorage）
- 単体テスト
- 統合テスト

## 工夫した点
- シンプル&使いやすいを意識。
- 使い回せるviewが多かったので部分テンプレートを多用。
- 部分テンプレートの中でcurrent_page?を使い、表示させる文字を場合分け。


## 開発環境

- Ruby (2.5.1)
- Rails (5.2.3)
- JavaScript
- jQuery
- PostgreSQL
- Heroku
- AWS S3
- RSpec


# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|

### Association
- has_many :logs, dependent: :destroy
- has_one_attached :avatar, dependent: :destroy

## logsテーブル

|Column|Type|Options|
|------|----|-------|
|place|string||
|date|date||
|point|string||
|member|text||
|user|references|foreign_key: true|
|En|time||
|Ex|time||
|Dt|integer||
|Max|float||
|Ave|float||
|Cl|integer||
|Temp|float||
|fish|text||
|image|text||

### Association
- belongs_to :user
- has_many_attached :images
