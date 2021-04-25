require 'rails_helper'

RSpec.describe Tutor, type: :model do
  before do
    @tutor = FactoryBot.build(:tutor)
  end
  describe 'チューター登録' do
    context 'チューター登録ができる' do
      it '全ての項目を入力することで登録できる' do
        expect(@tutor).to be_valid
      end
      it 'freeが入力されていなくても登録できる' do
        @tutor.free = nil
        expect(@tutor).to be_valid
      end
    end
    context '外国人登録ができない' do
      it 'emailがないと登録できない' do
        @tutor.email = nil
        @tutor.valid?
        expect(@tutor.errors.full_messages).to include 'Eメールを入力してください'
      end
      it 'emailに@がないと登録できない' do
        @tutor.email = 'email'
        @tutor.valid?
        expect(@tutor.errors.full_messages).to include 'Eメールは不正な値です'
      end
      it 'emailが重複していると登録できない' do
        @tutor.email = 'aaa@mail.com'
        @tutor.save
        @tutor1 = FactoryBot.build(:tutor)
        @tutor1.email = 'aaa@mail.com'
        @tutor1.valid?
        expect(@tutor1.errors.full_messages).to include 'Eメールはすでに存在します'
      end
      it 'passwordがないと登録できない' do
        @tutor.password = nil
        @tutor.valid?
        expect(@tutor.errors.full_messages).to include 'パスワードを入力してください'
      end
      it 'passwordが英字のみだと登録できない' do
        @tutor.password = 'aaaaaa'
        @tutor.password_confirmation = 'aaaaaa'
        @tutor.valid?
        expect(@tutor.errors.full_messages).to include 'パスワードには半角英字と半角数字を両方含めてください'
      end
      it 'passwordが数字のみだと登録できない' do
        @tutor.password = '111111'
        @tutor.password_confirmation = '111111'
        @tutor.valid?
        expect(@tutor.errors.full_messages).to include 'パスワードには半角英字と半角数字を両方含めてください'
      end
      it 'passwordが5文字以下だと登録できない' do
        @tutor.password = '11aaa'
        @tutor.password_confirmation = '11aaa'
        @tutor.valid?
        expect(@tutor.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @tutor.password = '111aaa'
        @tutor.password_confirmation = '222aaa'
        @tutor.valid?
        expect(@tutor.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it 'nameがないと登録できない' do
        @tutor.name = nil
        @tutor.valid?
        expect(@tutor.errors.full_messages).to include '名前を入力してください'
      end
      it 'genderがないと登録できない' do
        @tutor.gender = nil
        @tutor.valid?
        expect(@tutor.errors.full_messages).to include '性別を入力してください'
      end
      it 'country_regionがないと登録できない' do
        @tutor.country_region = nil
        @tutor.valid?
        expect(@tutor.errors.full_messages).to include '出身国/地域を入力してください'
      end
      it 'addressを入力していないと登録できない' do
        @tutor.address = nil
        @tutor.valid?
        expect(@tutor.errors.full_messages).to include '現住所を入力してください'
      end
      it 'jobを入力していないと登録できない' do
        @tutor.job = nil
        @tutor.valid?
        expect(@tutor.errors.full_messages).to include '仕事を入力してください'
      end
      it 'hobbyを入力していないと登録できない' do
        @tutor.hobby = nil
        @tutor.valid?
        expect(@tutor.errors.full_messages).to include '趣味を入力してください'
      end
      it 'motivationを入力していないと登録できない' do
        @tutor.motivation = nil
        @tutor.valid?
        expect(@tutor.errors.full_messages).to include '動機を入力してください'
      end
    end
  end

end
