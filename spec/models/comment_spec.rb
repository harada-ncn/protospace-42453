require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment=FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿成功' do
      it '完璧入力' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿失敗' do
      it '入力していない' do
        @comment.content=""
        @comment.valid?
        #binding.pry
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end
      it 'userアソシエーションしていない' do
        @comment.user = nil
        @comment.valid?
        #binding.pry
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it 'prototypeアソシエーションしていない' do
        @comment.prototype = nil
        @comment.valid?
        #binding.pry
        expect(@comment.errors.full_messages).to include("Prototype must exist")
      end
    end
  end
end
