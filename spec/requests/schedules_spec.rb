require 'rails_helper'

describe SchedulesController, type: :request do
  before do
    @schedule = FactoryBot.build(:schedule)
  end

  describe "GET / #index" do

    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get root_path
      expect(response.status).to eq 200
    end

    it 'indexアクションにリクエストするとレスポンスに新規登録フォームが存在する' do 
      get root_path
      expect(response.body).to include('新規登録')
    end

    it 'indexアクションにリクエストするとレスポンスにログインフォームが存在する' do 
      get root_path
      expect(response.body).to include('ログイン')
    end
  end
end


