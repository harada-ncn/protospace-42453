require 'rails_helper'

RSpec.describe Prototype, type: :model do
  before do
    @prototype = FactoryBot.build(:prototype)
  end

  describe 'プロトタイプ新規投稿' do
    context 'できる時' do
      it '完璧入力' do
        expect(@prototype.errors_fullmessages).to be_valid
      end
    end

    context '失敗するとき' do
      it 'プロトタイプの名称が必須であること' do
        @prototype.title = ''
        @prototype.valid?
        #binding.pry
        expect(@prototype.errors.full_messages).to include("Title can't be blank")
      end
      it 'キャッチコピーが必須であること' do
        @prototype.catch_copy = ''
        @prototype.valid?
        #binding.pry
        expect(@prototype.errors.full_messages).to include("Catch copy can't be blank")
      end
      it 'コンセプトの情報が必須であること' do
        @prototype.concept = ''
        @prototype.valid?
        #binding.pry
        expect(@prototype.errors.full_messages).to include("Concept can't be blank")
      end
      it '画像は1枚必須であること(ActiveStorageを使用)' do
        @prototype.image = ''
        @prototype.valid?
        #binding.pry
        expect(@prototype.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
