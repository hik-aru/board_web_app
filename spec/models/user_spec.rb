# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  birthday        :date
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'ユーザー名、パスワードがあれば有効な状態であること' do
    user = User.new(
      name: "jason",
      password: "test1234",
    )
    expect(user).to be_valid
  end 
  
  it 'ユーザー名が無ければ無効な状態であること' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it 'パスワードが無ければ無効な状態であること' do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it '重複したユーザー名なら無効な状態であること' do
    user = User.create(
      name: "taro",
      password: "test1234",
    )
    user = User.new(
      name: "taro",
      password: "test1234",
    )
    user.valid?
    expect(user.errors[:name]).to include("はすでに存在します")
  end

  
end
