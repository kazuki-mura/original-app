require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @schedule = FactoryBot.build(:schedule)
  end
  
  describe '活動報告' do
    context '投稿できる場合' do
      it '入力項目が正しければ投稿ができる' do
        expect(@schedule).to be_valid
      end

      it 'personが空でも登録できる' do
        @schedule.person = ''
        expect(@schedule).to be_valid
      end

      it 'personが英語でも登録できる' do
        @schedule.person = 'smith'
        expect(@schedule).to be_valid
      end

      it 'aimが空でも登録できる' do
        @schedule.aim = ''
        expect(@schedule).to be_valid
      end
      
      it 'starting_timeが空でも登録できる' do
        @schedule.starting_time = ''
        expect(@schedule).to be_valid
      end

      it 'ending_timeが空でも登録できる' do
        @schedule.ending_time = ''
        expect(@schedule).to be_valid
      end

      it 'reportが空でも登録できる' do
        @schedule.report = ''
        expect(@schedule).to be_valid
      end

      it 'otherが空でも登録できる' do
        @schedule.other = ''
        expect(@schedule).to be_valid
      end

      it 'start_timeが空でも登録できる' do
        @schedule.start_time = ''
        expect(@schedule).to be_valid
      end
      
    end

    context '投稿できない場合' do
      
      it 'clientが必須であること' do
        @schedule.client = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Clientを入力してください")
      end

      it 'content_idが必須であること' do
        @schedule.content_id = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Contentを入力してください")
      end   

      it 'content_idがid=1では登録出来ないこと' do
        @schedule.content_id = 1
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Contentcan't be blank")
      end

      it 'product_idが必須であること' do
        @schedule.product_id = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Productを入力してください")
      end   

      it 'product_idがid=1では登録出来ないこと' do
        @schedule.product_id = 1
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Productcan't be blank")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @schedule.user = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include('Userを入力してください')
      end
    
      it 'visit_dateが必須であること' do
        @schedule.visit_date = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Visit dateを入力してください")
      end   

    end
  end
end
