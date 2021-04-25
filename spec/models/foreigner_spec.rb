require 'rails_helper'

RSpec.describe Foreigner, type: :model do
  before do
    @foreigner = FactoryBot.build(:foreigner)
  end
  describe '外国人登録' do
    context '外国人登録ができる' do
      it '全ての項目を入力することで登録できる' do
        expect(@foreigner).to be_valid
      end
      it 'freeが入力されていなくても登録できる' do
        @foreigner.free = nil
        expect(@foreigner).to be_valid
      end
    end
    context '外国人登録ができない' do
      it 'emailがないと登録できない' do
        @foreigner.email = nil
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include 'Eメールを入力してください'
      end
      it 'emailに@がないと登録できない' do
        @foreigner.email = 'email'
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include 'Eメールは不正な値です'
      end
      it 'emailが重複していると登録できない' do
        @foreigner.email = 'aaa@mail.com'
        @foreigner.save
        @foreigner1 = FactoryBot.build(:foreigner)
        @foreigner1.email = 'aaa@mail.com'
        @foreigner1.valid?
        expect(@foreigner1.errors.full_messages).to include 'Eメールはすでに存在します'
      end
      it 'passwordがないと登録できない' do
        @foreigner.password = nil
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include 'パスワードを入力してください'
      end
      it 'passwordが英字のみだと登録できない' do
        @foreigner.password = 'aaaaaa'
        @foreigner.password_confirmation = 'aaaaaa'
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include 'パスワードには半角英字と半角数字を両方含めてください'
      end
      it 'passwordが数字のみだと登録できない' do
        @foreigner.password = '111111'
        @foreigner.password_confirmation = '111111'
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include 'パスワードには半角英字と半角数字を両方含めてください'
      end
      it 'passwordが5文字以下だと登録できない' do
        @foreigner.password = '11aaa'
        @foreigner.password_confirmation = '11aaa'
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @foreigner.password = '111aaa'
        @foreigner.password_confirmation = '222aaa'
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it 'nameがないと登録できない' do
        @foreigner.name = nil
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include '名前を入力してください'
      end
      it 'genderがないと登録できない' do
        @foreigner.gender = nil
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include '性別を入力してください'
      end
      it 'country_regionがないと登録できない' do
        @foreigner.country_region = nil
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include '出身国/地域を入力してください'
      end
      it 'languageがないと登録できない' do
        @foreigner.language = nil
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include '母国語を入力してください'
      end
      it 'japanese_levelを選択していないと登録できない' do
        @foreigner.japanese_level_id = 1
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include '日本語レベルを選択してください'
      end
      it 'addressを入力していないと登録できない' do
        @foreigner.address = nil
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include '現住所を入力してください'
      end
      it 'jobを入力していないと登録できない' do
        @foreigner.job = nil
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include '仕事を入力してください'
      end
      it 'hobbyを入力していないと登録できない' do
        @foreigner.hobby = nil
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include '趣味を入力してください'
      end
      it 'wonderを入力していないと登録できない' do
        @foreigner.wonder = nil
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include '懸念を入力してください'
      end
      it 'welcomeを入力していないtと登録できない' do
        @foreigner.welcome = nil
        @foreigner.valid?
        expect(@foreigner.errors.full_messages).to include '歓迎要件を入力してください'
      end
    end
  end
end
