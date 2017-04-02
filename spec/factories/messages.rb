FactoryGirl.define do

  factory :message do
    body      "投稿したよ"
    image     ""
    group_id  1
    user_id   2
  end

end