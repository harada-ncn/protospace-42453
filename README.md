# README
Usersテーブル
| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| email                | string     | null: false |
| encrypted_password   | string     | null: false |
| name                 | string     | null: false |
| profile              | text       | null: false |
| occupation           | text       | null: false |
| position             | text       | null: false |

-カラム
--email(string型, NOT NULL, ユニーク制約)
--encrypted_password(string型, NOT NULL)
--name(string型, NOT NULL)
--profile(text型, NOT NULL)
--occupation(text型, NOT NULL)
--position(text型, NOT NULL)

Commentsテーブル
| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| content              | text       | null: false |
| prototype            | references | null: false, foreign_key: true |
| user                 | references | null: false, foreign_key: true |

-カラム
--content(text型, NOT NULL)
--prototype(reference型, NOT NULL, 外部キー)
--user(reference型, NOT NULL, 外部キー)

Prototypesテーブル
| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| catch_copy         | text       | null: false |
| concept            | text       | null: false |
| user               | references | null: false, foreign_key: true |
-カラム
--title(string型, NOT NULL)
--catch_copy(text型, NOT NULL)
--concept(text型, NOT NULL)
--user(refernce型, NOT NULL, 外部キー)