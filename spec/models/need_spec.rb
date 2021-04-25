require 'rails_helper'

RSpec.describe Need, type: :model do
  before do
    @need = FactoryBot.build(:need)
  end
  describe 'チューター応募新規作成' do
    context 'チューター応募作成がうまくいく時' do
      it 'titleとdetailとremarkがあれば登録できる' do
        expect(@need).to be_valid
      end
      it 'remarkがなくても登録できる' do
        @need.remarks = nil
        expect(@need).to be_valid
      end
    end
    context 'チューター応募作成がうまく行かない時' do
      it 'titleがないと登録できない' do
        @need.title = nil
        @need.valid?
        expect(@need.errors.full_messages).to include 'タイトルを入力してください'
      end
      it 'detailがないと登録できない' do
        @need.detail = nil
        @need.valid?
        expect(@need.errors.full_messages).to include '詳細を入力してください'
      end
    end
  end
end
