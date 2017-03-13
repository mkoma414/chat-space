# README

## データベースの設計

###usersテーブル

|カラム    |タイプ     |NOT NULL制約|一意性制約|外部キー制約|INDEX|
|:-------|----------|-----------|--------|----------|----:|
|name    |string    |○          |×       |-         |×    |
|email   |string    |○          |○       |-         |×    |
|password|string    |○          |×       |-         |×    |

```ruby:リレーション
has_many :user_groups
has_many :groups, through: :user_groups
has_many :messages
```

### groupsテーブル

|カラム    |タイプ     |NOT NULL制約|一意性制約|外部キー制約|INDEX|
|:-------|-----------|-----------|--------|----------|----:|
|name    |string     |○          |○       |-         |×    |

```ruby:リレーション
has_many :user_groups
has_many :users, through: :user_groups
has_many :messages
```

### user_groupsテーブル

|カラム    |タイプ     |NOT NULL制約|一意性制約|外部キー制約|INDEX|
|:--------|----------|-----------|--------|----------|----:|
|users_id |references|○          |×       |○         |○    |
|groups_id|references|○          |×       |○         |○    |

```ruby:リレーション
belongs_to :user
belongs_to :group
```

### messagesテーブル

|カラム    |タイプ   |NOT NULL制約|一意性制約|外部キー制約|INDEX|
|:-------|----------|-----------|--------|----------|----:|
|body    |text      |×          |×       |○         |○    |
|image   |string    |×          |×       |○         |○    |
|group_id|references|○          |×       |○         |×    |
|user_id |references|○          |×       |○         |×    |

```ruby:リレーション
belongs_to :user
belongs_to :group
```

