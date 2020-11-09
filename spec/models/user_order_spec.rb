require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品購入登録' do
    context '商品の購入がうまくいくとき' do
      it '任意項目以外の記入がされていること' do
        expect(@user_order).to be_valid
      end

      it 'buildingが空でも登録できる' do
        @user_order.building_name = nil
        expect(@user_order).to be_valid
      end
    end

    context '商品の購入がうまくいかないとき' do
      it 'tokenが空では登録できない' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと登録できない' do
        @user_order.postal_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフン(-)が含まれないと登録できない' do
        @user_order.postal_code = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code はハイフンを(-)を含んで記述してください。')
      end

      it 'postal_codeのハイフン以前の文字数が3文字でないと登録できない' do
        @user_order.postal_code = '12-3456'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code はハイフンを(-)を含んで記述してください。')
      end

      it 'postal_codeのハイフン以降の文字数が4文字でないと登録できない' do
        @user_order.postal_code = '123-456'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code はハイフンを(-)を含んで記述してください。')
      end

      it 'prefectureが空だと登録できない' do
        @user_order.prefecture_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefectureが1だと登録できない' do
        @user_order.prefecture_id = '1'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Prefecture を選択してください')
      end

      it 'cityが空だと登録できない' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end

      it 'street_numberが空だと登録できない' do
        @user_order.street_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Street number can't be blank")
      end

      it 'phone_numberが空だと登録できない' do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁以上だと登録できない' do
        @user_order.phone_number = '090123456789'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number は10桁か11桁の半角数字ハイフン(-)なしで入力してください ')
      end

      it 'phone_numberにハイフンがあると登録できない' do
        @user_order.phone_number = '03-124-678'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number は10桁か11桁の半角数字ハイフン(-)なしで入力してください ')
      end
    end
  end
end
