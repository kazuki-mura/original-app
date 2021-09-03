require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる時' do
      it '入力項目が正しければ登録できる' do
       expect(@user).to be_valid
      end
      
      it 'passwordとpassword_confirmationが6文字以上で半角英数字混合であれば登録できる' do
        @user.password = 'test1234'
        @user.password_confirmation = 'test1234'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない時' do

      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end

      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end

      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordを入力してください", "Passwordは不正な値です", "Password confirmationとPasswordの入力が一致しません")
      end

      it 'パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）' do
        @user.password = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは6文字以上で入力してください")
      end

      it 'パスワードは、半角英字のみでは登録出来ないこと' do
        @user.password = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは不正な値です")
      end

      it 'パスワードは、半角数字のみでは登録出来ないこと'do
        @user.password = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは不正な値です")
      end

      it 'パスワードは、全角では登録出来ないこと'do
        @user.password = 'test１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは不正な値です")
      end

      it 'パスワードは、確認用を含めて2回入力すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end

      it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
        @user.password_confirmation = 'test123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end

      it '名字が必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください", "姓は不正な値です")
      end
      
      it '名前が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前は不正な値です")
      end
      
      it 'ユーザー本名（名字）は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓は不正な値です")
      end
      
      it 'ユーザー本名（名前）は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
   end
  end 


  describe 'ログイン' do
    context 'ユーザーがログインができる時' do
      it '入力項目が正しければログインできる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザーがログインできない時' do
      it 'メールアドレスが正しくない場合はログイン出来ないこと' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end
      it 'パスワードが正しくない場合はログイン出来ないこと' do
        @user.password = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
    end
  end
end
