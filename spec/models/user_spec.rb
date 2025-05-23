require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'できる時' do
      it '完璧入力' do
        expect(@user).to be_valid
      end
    end

    context '失敗するとき' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'ユーザーの新規登録には、パスワードが必須であること' do
        @user.password = ''
        @user.valid?

        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'ユーザーの新規登録には、パスワードは6文字以上であること' do
        @user.password = '12345'
        @user.password_confirmation= '12345'
        @user.valid?

        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'ユーザーの新規登録には、パスワードとパスワード確認用の値の一致が必須であること' do
        @user.password_confirmation= "#{@user.password}test"
        @user.valid?

        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザーの新規登録には、プロフィールが必須であること' do
        @user.profile = ''
        @user.valid?
   
        expect(@user.errors.full_messages).to include("Profile can't be blank")
      end
      it 'ユーザーの新規登録には、所属が必須であること' do
        @user.occupation = ''
        @user.valid?

        expect(@user.errors.full_messages).to include("Occupation can't be blank")
      end
      it 'ユーザーの新規登録には、役職が必須であること' do
        @user.position = ''
        @user.valid?

        expect(@user.errors.full_messages).to include("Position can't be blank")
      end
      it 'ユーザーの新規登録には、メールアドレスは一意性である' do
        @beteranuser = FactoryBot.create(:user)
        @user.email = @beteranuser.email
        @user.valid?

        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
    end
  end
end
