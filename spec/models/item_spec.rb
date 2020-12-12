require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context "商品出品がうまくいく時" do
      it "全ての項目が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context "商品出品がうまくいかない時" do
      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "explanationが空だと登録できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it "categoryが空だと登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "statusが空だと登録できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it "delivery_feeが空だと登録できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
      end
      it "prefectureが空だと登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "send dayが空だと登録できない" do
        @item.send_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Send day can't be blank"
      end
      it "item.imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "category_idが1だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it "status_idが1だと登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end
      it "delivery_fee_idが1だと登録できない" do
        @item.delivery_fee_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee must be other than 1"
      end
      it "send day_idが1だと登録できない" do
        @item.send_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Send day must be other than 1"
      end
      it "priceが300未満だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it "priceが10000000以上だと登録できない" do
        @item.price = 10000001
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
    end
  end
end
