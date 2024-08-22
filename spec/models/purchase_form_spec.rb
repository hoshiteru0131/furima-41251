require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)

    @purchase_form = FactoryBot.build(:purchase_form, item_id: item.id, user_id: user.id)
  end

  describe '配送先情報の保存' do
    context '保存ができる場合' do
      it 'すべての情報が正しく入力されていれば保存できる' do
        expect(@purchase_form).to be_valid
      end

      it '建物名が空でも保存できる' do
        @purchase_form.building = ''
        expect(@purchase_form).to be_valid
      end
    end

    context '保存ができない場合' do
      it '郵便番号が空では保存できない' do
        @purchase_form.postal_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が正しい形式でないと保存できない' do
        @purchase_form.postal_code = '1234567' # ハイフンがない場合
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県が空では保存できない' do
        @purchase_form.prefecture_id = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県が0のままだと保存できない' do
        @purchase_form.prefecture_id = 0 # 0は未選択の状態を示す
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it '市区町村が空では保存できない' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では保存できない' do
        @purchase_form.address = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では保存できない' do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が10桁未満では保存できない' do
        @purchase_form.phone_number = '090123456' # 9桁の番号
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が12桁以上では保存できない' do
        @purchase_form.phone_number = '090123456789' # 12桁の番号
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号にハイフンが含まれていると保存できない' do
        @purchase_form.phone_number = '090-1234-5678'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空では登録できない' do
        @purchase_form.token = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では登録できない' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @purchase_form.item_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
