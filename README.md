# アプリケーション名
Teal(ティール)

# アプリケーション概要
営業進捗管理ツール

# URL

# テスト用アカウント
ID：

PW：

# 利用方法
見込み客となる案件の情報を登録し、社内で進捗状況を共有する。  
案件の情報をcsvとして出力し、データ分析資料として活用できる。

# アプリケーションを作成した背景
数十名規模の組織を想定。無駄な工数を減らし、重要な事に注力できる仕組みを作りたいと思い作成した。  
現在扱っている案件、及び獲得済み案件の共有をすることで、目標の管理や予実管理をしやすくする。  
常に共有することで透明性を実現し、報告・管理の工数を削減する。また、欠員リスク対策となる。

# 洗い出した要件
[要件定義シート](https://docs.google.com/spreadsheets/d/1Hs8RbyDW4XqskhkS3K75mMlFVQYvBkRDmCIq3DJgC0o/edit?usp=sharing)

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能
・指定した条件で表示する案件を絞ることができる。  
・レポート表示した案件をCSVとして出力する。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/f9b02463c22a6fa5f8a766a5d67166f4.png)](https://gyazo.com/f9b02463c22a6fa5f8a766a5d67166f4)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/329d17a264acfa45b9dfc9a098905d84.png)](https://gyazo.com/329d17a264acfa45b9dfc9a098905d84)

# 開発環境
・フロントエンド Ruby on Rails  
・バックエンド Ruby on Rails  
・インフラ MacBookPro(Apple M1 Pro)  
・テスト Rspec  
・テキストエディタ Visual Studio Code  
・タスク管理 Github

# ローカルでの動作方法

# 工夫したポイント


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

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| op_name                | string     | null: false                    |
| user                   | references | null: false, foreign_key: true |
| company                | string     | null: false                    |
| company_area_id        | integer    | null: false                    |
| person_in_charge       | string     | null: false                    |
| date_of_obtaining      | date       | null: false                    |
| date_of_participation  | date       |                                |
| date_of_negotiation    | date       |                                |
| estimated_sales_amount | integer    |                                |
| sales_amount           | integer    |                                |
| contracted_date        | date       |                                |
| lost_order_date        | date       |                                |
| phase_id               | integer    | null: false                    |
| free_text              | text       |                                |

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