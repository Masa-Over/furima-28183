require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入(住所)' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:user_order, user_id: @user.id, item_id: @item.id)
      sleep (0.5)
    end
    context "商品ができる時" do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@order).to be_valid
      end
      it '建物番号が空でも購入できる' do
        @order.building = ""
        expect(@order).to be_valid
      end
    end
    context "商品購入ができない時" do
      it 'prefecture_idが空の時' do
        @order.prefecture_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idが1の時' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'municipalitiesが空の時' do
        @order.municipalities = ""
        @order.valid?
        expect(@order.errors.full_messages).to include "Municipalities can't be blank"
      end
      it 'addressが空の時' do
        @order.address = ""
        @order.valid?
        expect(@order.errors.full_messages).to include "Address can't be blank"
      end
      it 'postal_codeが空の時' do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include "Postal code can't be blank", "Postal code is invalid. Include hyphen(-)"
      end
      it 'postal_codeがハイフン無しの時' do
        @order.postal_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end 
      it 'postal_codeに数字とハイフン以外の文字が含まれる時' do
        @order.postal_code = "123.4567"
        @order.valid?
        expect(@order.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end
      it 'phone_numberが空の時' do
        @order.phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが11桁以上の時' do
        @order.phone_number = "090123456789"
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number is too long (maximum is 11 characters)"
      end
      it 'phone_numberが数字以外の入力があった時' do
        @order.phone_number = "a"
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number is not a number"
      end
      it 'item_idが空の時' do
        @order.item_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include "Item can't be blank"
      end
      it 'user_idが空の時' do
        @order.user_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include "User can't be blank"
      end
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
