require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  context '内容に問題ない場合' do
    it "配送先情報とtokenがあれば保存ができること" do
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "post_codeが『3桁の半角数字 ＋（ー）＋ 4桁の半角数字以外』では保存ができないこと" do
      @order_address.post_code = "1234-1234"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it "post_codeが空では登録できないこと" do
      @order_address.post_code = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it "prefecture_idが空では登録できないこと" do
      @order_address.prefecture_id = "---"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "cityが空では登録できないこと" do
      @order_address.city = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it "house_numberが空では登録できないこと" do
      @order_address.house_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it "phone_numberが空では登録できないこと" do
      @order_address.phone_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it "phone_numberが10桁、11桁の半角数字以外では登録できないこと" do
      @order_address.phone_number = "11111111"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
    end

    it "tokenが空では登録できないこと" do
      @order_address.token = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
