# データベース設計

## foreignersテーブル

| Column             | Type     | option       |
|--------------------|----------|--------------|
| email              | string   | null: false  |
| encrypted_password | string   | null: false  |
| name               | string   | null: false  |
| gender             | string   | null: false  |
| country_region     | string   | null: false  |
| language           | string   | null: false  |
| japanese_level     | integer  | null: false  |
| address            | string   | null: false  |
| job                | string   | null: false  |
| hobby              | string   | null: false  |
| concern            | string   | null: false  |
| welcome            | string   | null: false  |
| free               | string   | null: false  |
### Association
- has_many :chat_foreigners
- has_many :chats, through: :chat_foreigners
- has_many :messages

## tutorsテーブル

| Column             | Type     | option       |
|--------------------|----------|--------------|
| email              | string   | null: false  |
| encrypted_password | string   | null: false  |
| name               | string   | null: false  |
| gender             | string   | null: false  |
| country_region     | string   | null: false
| language           | string   | null: false  |
| address            | string   | null: false  |
| job                | string   | null: false  |
| hobby              | string   | null: false  |
| motivation         | string   | null: false  |
| free               | string   | null: false  |
### Association
- has_many :chat_tutors
- has_many :chats, through: :chat_tutors
- has_many :messages

# needs テーブル

| Column             | Type     | option       |
|--------------------|----------|--------------|
| title              | string   | null: false  |
| detail             | string   | null: false  |
| remarks            | string   | null: false  |
#### Association
- belongs_to :foreigner

# offerings テーブル

| Column             | Type     | option       |
|--------------------|----------|--------------|
| title              | string   | null: false  |
| detail             | string   | null: false  |
| remarks            | string   | null: false  |
#### Association
- belongs_to :tutor


### chats テーブル
| Column             | Type            | option           |
| ------------------ | --------------- | ---------------- |
| title              | string          |                  |
#### Association
- has_many :chat_users
- has_one :tutor, through: :chat_tutors
- has_one :foreigner, through: :chat_foreigners
- has_many :messages

### chat_foreigners テーブル
| Column             | Type            | option                         |
| ------------------ | --------------- | ------------------------------ |
| foreigner          | references      | null: false, foreign_key: true |
| chat               | references      | null: false, foreign_key: true |
#### Association
- belongs_to :foreigner
- belongs_to :chat

### chat_tutors テーブル
| Column             | Type            | option                         |
| ------------------ | --------------- | ------------------------------ |
| tutor              | references      | null: false, foreign_key: true |
| chat               | references      | null: false, foreign_key: true |
#### Association
- belongs_to :tutor
- belongs_to :chat

### messages テーブル
| Column             | Type            | option                         |
| ------------------ | --------------- | ------------------------------ |
| foreigner          | references      | null: false, foreign_key: true |
| tutor              | references      | null: false, foreign_key: true |
| chat               | references      | null: false, foreign_key: true |
| content            | text            | null: false                    |
#### Association
- belongs_to :foreigner
- belongs_to :tutor
- belongs_to :chat