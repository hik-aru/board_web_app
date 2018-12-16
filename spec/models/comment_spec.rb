require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  it '名前が無ければ無効な状態であること' do
    comment = Comment.new(name: nil)
    comment.valid?
    expect(comment.errors[:name]).to include("を入力してください")
  end

  it 'コメントが無ければ無効な状態であること' do
    comment = Comment.new(comment: nil)
    comment.valid?
    expect(comment.errors[:comment]).to include("を入力してください")
  end

end
