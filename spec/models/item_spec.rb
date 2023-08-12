require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'item_name, description, details_category_id, details_condition_id, delivery_cost_id, prefecture_id, delivery_date_id, priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'details_category_idが空では出品できない' do
        @item.details_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Details category can't be blank")
      end

      it 'details_category_idが0では出品できない' do
        @item.details_category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Details category must be other than 0')
      end

      it 'details_category_idが半角数字の1〜10以外では出品できない' do
        @item.details_category_id = 11
        @item.valid?
        expect(@item.errors.full_messages).to include('Details category must be less than or equal to 10')
      end

      it 'details_condition_idが空では出品できない' do
        @item.details_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Details condition can't be blank")
      end

      it 'details_condition_idが0では出品できない' do
        @item.details_condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Details condition must be other than 0')
      end

      it 'details_condition_idが半角数字の1〜6以外では出品できない' do
        @item.details_condition_id = 11
        @item.valid?
        expect(@item.errors.full_messages).to include('Details condition must be less than or equal to 6')
      end

      it 'delivery_cost_idが空では出品できない' do
        @item.delivery_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost can't be blank")
      end

      it 'delivery_cost_idが0では出品できない' do
        @item.delivery_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery cost must be other than 0')
      end

      it 'delivery_cost_idが半角数字の1〜2以外では出品できない' do
        @item.delivery_cost_id = 11
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery cost must be less than or equal to 2')
      end

      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが0では出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it 'prefecture_idが半角数字の1〜47以外では出品できない' do
        @item.prefecture_id = 55
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be less than or equal to 47')
      end

      it 'delivery_date_idが空では出品できない' do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end

      it 'delivery_date_idが0では出品できない' do
        @item.delivery_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery date must be other than 0')
      end

      it 'delivery_date_idが半角数字の1〜3以外では出品できない' do
        @item.delivery_date_id = 11
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery date must be less than or equal to 3')
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300〜9999999以外では出品できない' do
        @item.price = 0.2
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end

      it 'priceが300円未満では出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceがが9_999_999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
