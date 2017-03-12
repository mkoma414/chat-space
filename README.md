# README

## データベースの設計

###usersテーブル

|カラム    |タイプ     |NOT NULL制約|一意性制約|外部キー制約|INDEX|
|:-------|----------|-----------|--------|----------|----:|
|name    |string    |○          |×       |-         |×    |
|email   |string    |○          |○       |-         |×    |
|password|string    |○          |×       |-         |×    |
|group_id|references|○          |×       |○         |×    |

```ruby:リレーション
has_many :users_groups
has_many :groups, through: :users_groups
```

### groupsテーブル

|カラム    |タイプ     |NOT NULL制約|一意性制約|外部キー制約|INDEX|
|:-------|-----------|-----------|--------|----------|----:|
|name    |string     |○          |○       |-         |×    |
|user_id |references |○          |×       |○         |×    |

```ruby:リレーション
has_many :users_groups
has_many :users, through: :users_groups
```

### users_groupsテーブル

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

