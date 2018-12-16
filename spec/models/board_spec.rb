require 'rails_helper'

RSpec.describe Board, type: :model do

  it '作成者、タイトル、本文があれば有効な状態であること' do
    board = Board.new(
      name: "Robin",
      title: "Ruby on Rails",
      body: "プログラム書くのって楽しい！"
    )
    expect(board).to be_valid
  end 
  
  it '作成者が無ければ無効な状態であること' do
    board = Board.new(name: nil)
    board.valid?
    expect(board.errors[:name]).to include("を入力してください")
  end

  it 'タイトルが無ければ無効な状態であること' do
    board = Board.new(title: nil)
    board.valid?
    expect(board.errors[:title]).to include("を入力してください")
  end

  it '本文が無ければ無効な状態であること' do
    board = Board.new(body: nil)
    board.valid?
    expect(board.errors[:body]).to include("を入力してください")
  end

  it '作成者が11文字以上であれば無効な状態であること' do
    board = Board.new(body: "12345678910")
    board.valid?
    expect(board.errors[:title]).to include("を入力してください")
  end

  it 'タイトルが31文字以上であれば無効な状態であること' do
    board = Board.new(title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    board.valid?
    expect(board.errors[:title]).to include("は30文字以内で入力してください")
  end

end
