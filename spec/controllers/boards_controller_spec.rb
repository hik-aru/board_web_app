require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it 'レスポンスコードが200であること' do
        expect(response).to have_http_status(:ok)
    end

    it 'indexテンプレートをレンダリングすること' do
        expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'レスポンスコードが200であること' do
        expect(response).to have_http_status(:ok)
    end

    it 'newテンプレートをレンダリングすること' do
        expect(response).to render_template :new
    end

    it '新しいboardオブジェクトがビューに渡されること' do
        expect(assigns(:board)).to be_a_new Board
    end
  end

end
