require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end
    it "passwordが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include "Password can't be blank"
    end
    it "passwordが英字と数字の両方を含めないと登録できない" do
      user = FactoryBot.build(:user)
      user.password = "aaaaaa"
      user.password_confirmation = "aaaaaa"
      user.valid?
      expect(user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end
    it "苗字が空だと登録できない" do
      user = FactoryBot.build(:user)
      user.familyname = ""
      user.valid?
      expect(user.errors.full_messages).to include "Familyname 全角文字を使用してください"
    end
    it "苗字が全角出ないと登録できない" do
      user = FactoryBot.build(:user)
      user.familyname = ""
      user.valid?
      expect(user.errors.full_messages).to include "Familyname 全角文字を使用してください"
    end
    it "名前が空だと登録できない" do
      user = FactoryBot.build(:user)
      user.firstname = ""
      user.valid?
      expect(user.errors.full_messages).to include "Firstname 全角文字を使用してください"
    end
    it "名前が全角でないと登録できない" do
      user = FactoryBot.build(:user)
      user.firstname = ""
      user.valid?
      expect(user.errors.full_messages).to include "Firstname 全角文字を使用してください"
    end
    it "苗字の振り仮名が空だと登録できない" do
      user = FactoryBot.build(:user)
      user.familyname_katakana = ""
      user.valid?
      expect(user.errors.full_messages).to include "Familyname katakana 全角文字を使用してください"
    end
    it "苗字の振り仮名がカタカナで全角でないと登録できない" do
      user = FactoryBot.build(:user)
      user.familyname_katakana = ""
      user.valid?
      expect(user.errors.full_messages).to include "Familyname katakana 全角文字を使用してください"
    end
    it "名前の振り仮名が空だと登録できない" do
      user = FactoryBot.build(:user)
      user.firstname_katakana = ""
      user.valid?
      expect(user.errors.full_messages).to include "Firstname katakana 全角文字を使用してください"
    end
    it "名前の振り仮名がカタカナで全角でないと登録できない" do
      user = FactoryBot.build(:user)
      user.firstname_katakana = ""
      user.valid?
      expect(user.errors.full_messages).to include "Firstname katakana 全角文字を使用してください"
    end
    it "誕生日が空だと登録できない" do
      user = FactoryBot.build(:user)
      user.birthday = ""
      user.valid?
      expect(user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
