require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品ができる場合' do
    it '全ての項目が正しく入力されていれば出品できる' do
      expect(@item).to be_valid
    end
  end

  context '商品出品ができない場合' do
    it '商品名が空では出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '価格が空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が300円未満では出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格が9,999,999円を超えると出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it '価格が半角数字でないと出品できない' do
      @item.price = '３０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    # その他のバリデーションに関するテストも同様に書きます
  end
end
