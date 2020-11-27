require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context "新規登録がうまくいくとき" do
      it "nickname、email、passwordとpassword_confirmation、familyname、firstname、familyname_katakana、firstname_katakana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが英字と数字の両方が含まれていたら登録できる" do
        @user.password = "111aaa"
        @user.password_confirmation = "111aaa"
        expect(@user).to be_valid
      end
      it "苗字が全角であれば登録できる" do
        @user.familyname = "あべ"
        expect(@user).to be_valid
      end
      it "名前が全角であれば登録できる" do
        @user.firstname = "しんぞう"
        expect(@user).to be_valid
      end
      it "苗字の振り仮名がカタカナであれば登録できる" do
        @user.familyname_katakana = "アベ"
        expect(@user).to be_valid
      end
      it "名前の振り仮名がカタカナであれば登録できる" do
        @user.firstname_katakana = "シンゾウ"
        expect(@user).to be_valid
      end
    end
    context "新規登録がうまくいかないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailに@が含まれないと登録できない" do
        @user.email = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordが英字と数字の両方を含めないと登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it "苗字が空だと登録できない" do
        @user.familyname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Familyname 全角文字を使用してください"
      end
      it "苗字が全角出ないと登録できない" do
        @user.familyname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Familyname 全角文字を使用してください"
      end
      it "名前が空だと登録できない" do
        @user.firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname 全角文字を使用してください"
      end
      it "名前が全角でないと登録できない" do
        @user.firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname 全角文字を使用してください"
      end
      it "苗字の振り仮名が空だと登録できない" do
        @user.familyname_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Familyname katakana 全角文字を使用してください"
      end
      it "苗字の振り仮名がカタカナで全角でないと登録できない" do
        @user.familyname_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Familyname katakana 全角文字を使用してください"
      end
      it "名前の振り仮名が空だと登録できない" do
        @user.firstname_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname katakana 全角文字を使用してください"
      end
      it "名前の振り仮名がカタカナで全角でないと登録できない" do
        @user.firstname_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Firstname katakana 全角文字を使用してください"
      end
      it "誕生日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'email', with: @user.email
      fill_in 'encrypted_password',with: @user.password
      find('input[name ="commit"]').click
      expect("/").to eq root_path
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'email', with: ""
      fill_in 'encrypted_password', with: ""
      find('input[name="commit"]').click
      expect(current_path).to eq new_user_session_path
    end
  end
end