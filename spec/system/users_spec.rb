require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user=FactoryBot.create(:user)
  end

  it 'ユーザーの新規登録には、パスワードは確認用を含めて2回入力すること' do
    @user1=FactoryBot.build(:user)
    visit  new_user_registration_path
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード（6文字以上）', with: @user.password
    fill_in 'パスワード再入力', with: @user.password_confirmation
    fill_in 'ユーザー名', with: @user.name
    fill_in 'プロフィール', with: @user.profile
    fill_in '役職', with: @user.occupation
    fill_in '所属', with: @user.position
    
    click_on '新規登録'
    sleep 1

    expect(page).to have_current_path(root_path)
  end

  it '必要な情報を入力すると、ログインができること' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード（6文字以上）', with: @user.password
    click_on 'ログイン'
    sleep 1

    expect(page).to have_current_path(root_path)
  end

  it 'フォームに適切な値が入力されていない状態では、新規登録・ログインはできず、そのページに留まること（新規登録/ログイン）' do
    visit  new_user_registration_path
    @user1=FactoryBot(:user)
    fill_in 'パスワード（6文字以上）', with: @user.password
    fill_in 'パスワード再入力', with: @user.password_confirmation
    fill_in 'ユーザー名', with: @user.name
    fill_in 'プロフィール', with: @user.profile
    fill_in '役職', with: @user.occupation
    fill_in '所属', with: @user.position
    
    click_on '新規登録'
    sleep 1

    expect(page).to have_current_path(new_user_registration)
  end

  it 'トップページから、ログアウトができること' do
  
  end

  it 'ログアウト状態では、ヘッダーに「新規登録」「ログイン」のリンクが存在すること' do
  
  end

  it 'ログイン状態では、ヘッダーに「ログアウト」「New Proto」のリンクが存在すること' do
  
  end

  it 'ログイン状態では、トップページに「こんにちは、〇〇さん」とユーザー名が表示されていること' do
  
  end
  
end
