# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :user do
    sequence(:email)    { |n| "user#{n}@gmail.com" }
    password            { 'password123' }
  end

  trait :user do
    after(:create) { |user| user.add_role(:user) }
  end

  trait :admin do
    after(:create) { |user| user.add_role(:admin) }
  end
end
