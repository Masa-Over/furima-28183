require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入' do
    before do
      @order = FactoryBot.build(:user_order)
    end
    context "商品ができる時" do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@order).to be_valid
      end
    end
    context "商品購入ができない時" do
      it 'prefecture_idが空の時' do
        @order.prefecture_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture can't be blank"
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
    end
  end
end
