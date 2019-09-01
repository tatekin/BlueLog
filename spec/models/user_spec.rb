require 'rails_helper'
describe User do
  describe '#create' do

    it "登録できます！" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "名前があるか" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "メールアドレスがあるか" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    
    it "パスワードがあるか" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "確認用パスワードがあるか" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end
    
    it "重複したメールアドレスは登録できません" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "名前が１１文字以上はだめよ" do
      user = build(:user, name: "aaaaaaaaaaa")
      user.valid?
      expect(user.errors[:name][0]).to include("は10文字以内で入力してください")
    end
    
    it "名前が１０文字以下ならOK！" do
      user = build(:user, name: "aaaaaaaaaa")
      expect(user).to be_valid
    end
    
    it "パスワードが６文字以上ならOK！" do
      user = build(:user, password: "aaaaaa", password_confirmation: "aaaaaa")
      expect(user).to be_valid
    end

    it "パスワードが６文字以下はだめよ" do
      user = build(:user, password: "aaaaa", password_confirmation: "aaaaa")
      user.valid?
      expect(user.errors[:password][0]).to include("は6文字以上で入力してください")
    end

  end
end