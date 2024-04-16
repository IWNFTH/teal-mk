# アプリケーション名
Teal(ティール)

# アプリケーション概要
営業進捗管理ツール

# URL
非公開
<!-- http://35.76.209.211/ -->

# 利用目的
見込み客となる案件の情報を登録し、社内で進捗状況を共有する。
案件の情報をcsvとして出力し、データ分析資料として活用できる。

# アプリケーションを作成した背景
数十名規模の組織を想定。無駄な工数を減らし、重要な事に注力できる仕組みを作りたいと思い作成した。  
社内で現在扱っている案件、及び獲得済み案件の共有をすることで、目標の管理や予実管理をしやすくする。  
常に共有することで透明性を実現し、報告・管理の工数を削減する。また、欠員リスク対策となる。  
前職にて使用していたSalesForceをモチーフに作成した。

## 洗い出した要件
[要件定義シート](https://docs.google.com/spreadsheets/d/1Hs8RbyDW4XqskhkS3K75mMlFVQYvBkRDmCIq3DJgC0o/edit?usp=sharing)

## 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能
・情報を更新した際にポップアップを表示する機能  
・テーブルにソートをかける機能  
・条件で絞ったデータをCSVで出力する機能  
・案件を投稿した際、案件名は「YYMMDD-001案件名」と自動で番号が振られる機能。  

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/12b43e8a8bab803eec14273d1950050d.png)](https://gyazo.com/12b43e8a8bab803eec14273d1950050d)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/cd2a19af9be36280696f65bdfa63cb4c.png)](https://gyazo.com/cd2a19af9be36280696f65bdfa63cb4c)

# 開発環境
・Ruby 2.6.5
・Ruby on Rails 6.0.5
・インフラ MacBookPro(Apple M1 Pro)
・テスト Rspec
・タスク管理 Github

# ローカルでの動作方法
以下のコマンドを順に実行  
#### ターミナル
```
% git clone https://github.com/IWNFTH/teal-mk.git
% cd teal-mk
% bundle install
% yarn install
```

# 工夫したポイント
・新規案件投稿をする際にモーダルウィンドウを使用することで、投稿しやすくした。  
・登録した案件のデータはCSVにて出力できる機能を実装し、データ分析に活用できるようにした。  
・案件一覧の`エリア`、`担当者`、`フェーズ`をクリックすると、そのカテゴリーに当てはまる案件に絞れるようにした。  
・案件詳細兼編集画面にて、フェーズをプログレスバーで表し、進捗状況を一目でわかるようにした。  
・`予定売上金額`、`確定売上金額`を入力すると、概算粗利益が表示されるロジックを実装した。  

# テーブル情報

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :opportunities
- has_many :comments

## opportunities テーブル

| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| op_name                      | string     | null: false                    |
| user                         | references | null: false, foreign_key: true |
| company                      | string     | null: false                    |
| company_area_id              | integer    | null: false                    |
| person_in_charge             | string     | null: false                    |
| date_of_obtaining            | date       | null: false                    |
| date_of_participation        | date       |                                |
| date_of_negotiation          | date       |                                |
| estimated_sales_amount       | integer    |                                |
| sales_amount                 | integer    |                                |
| estimated_approximate_profit | integer    |                                |
| approximate_profit           | integer    |                                |
| contracted_date              | date       |                                |
| lost_order_date              | date       |                                |
| phase_id                     | integer    | null: false                    |
| free_text                    | text       |                                |

### Association

- belongs_to :user
- has_many   :comments


## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| opportunity | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :opportunity