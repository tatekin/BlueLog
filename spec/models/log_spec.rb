require 'rails_helper'

RSpec.describe Log, type: :model do

  describe '#create' do
    context '保存できないよ！' do
      it 'user_idがないとだめ！' do
        log = build(:log, user_id: nil)
        log.valid?
        expect(log.errors[:user]).to include('を入力してください')
      end
    end
  end

end