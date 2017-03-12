# README

## データベースの設計

###usersテーブル

|カラム    |タイプ  |NOT NULL制約|一意性制約|外部キー制約|INDEX|
|:-------|-------|-----------|--------|----------|----:|
|name    |string |○          |×       |-         |×    |
|email   |string |○          |○       |-         |×    |
|password|string |○          |×       |-         |×    |
|group_id|integer|○          |×       |○         |×    |


### groupsテーブル

|カラム    |タイプ   |NOT NULL制約|一意性制約|外部キー制約|INDEX|
|:-------|--------|-----------|--------|----------|----:|
|name    |string  |○          |○       |-         |×    |
|user_id |integer |○          |×       |○         |×    |



### users_groupsテーブル

|カラム    |タイプ   |NOT NULL制約|一意性制約|外部キー制約|INDEX|
|:--------|--------|-----------|--------|----------|----:|
|users_id |integer |○          |×       |○         |○    |
|groups_id|integer |○          |×       |○         |○    |


### messagesテーブル

|カラム    |タイプ   |NOT NULL制約|一意性制約|外部キー制約|INDEX|
|:-------|--------|-----------|--------|----------|----:|
|body    |text    |×          |×       |○         |○    |
|image   |string  |×          |×       |○         |○    |
|group_id|integer |○          |×       |○         |×    |
|user_id |integer |○          |×       |○         |×    |

