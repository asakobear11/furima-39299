require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'postcode, prefecture_id, city, block, phone_number, user_id, item_id, tokenが存在すれば購入できる' do
        expect(@address).to be_valid
      end

      it 'buildingは空でも保存できる' do
        @address.building = ''
        expect(@address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'postcodeが空では購入できない' do
        @address.postcode = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postcodeが「3桁ハイフン4桁」の半角文字列以外では購入できない' do
        @address.postcode = 1_234_567
        @address.valid?
        expect(@address.errors.full_messages).to include('Postcode 　　　　')
      end

      it 'prefecture_idが空では購入できない' do
        @address.prefecture_id = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では購入できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空では購入できない' do
        @address.block = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁未満では購入できない' do
        @address.phone_number = 123_456_789
        @address.valid?
        expect(@address.errors.full_messages).to include('　　　　　　')
      end

      it 'phone_numberが12桁以上では購入できない' do
        @address.phone_number = 123_456_789_012
        @address.valid?
        expect(@address.errors.full_messages).to include('　　　　　　')
      end

      it 'tokenが空では登録できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
