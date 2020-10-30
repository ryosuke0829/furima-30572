require 'rails_helper'

describe User do
  describe 'ユーザー新規登録' do
    it 'nickname、first_name、last_name、first_name_kana、last_neme_kana、email、password、password_confirmation、birth_dateが存在すれば登録できること' do
      user = build(:user)
      expect(user).to be_valid
    end
    it 'nicknameが空ならNG' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it 'emailが空ならNG' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it 'emailに@とドメインが存在する場合は登録できること ' do
      user = create(:user)
      another_user = build(:user, email: 'kkk@gmail.com')
      another_user.valid?
      expect(user).to be_valid
    end
    it ' 重複したemailが存在する場合は登録できないこと ' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end
    it 'passwordが空ならNG' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it 'passwordが存在してもpassword_confirmationがない場合は登録できないこと' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it ' passwordが6文字以上であれば登録できること ' do
      user = build(:user, password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user).to be_valid
    end
    it ' passwordが5文字以下であれば登録できないこと ' do
      user = build(:user, password: '00000', password_confirmation: '00000')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
    it "passwordが6文字以上で、英数字の組み合わせであれば登録できること" do
      user = build(:user, password: "abc123", password_confirmation: "abc123")
      user.valid?
      expect(user).to be_valid
    end

    it 'first_nameが空ならNG' do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it 'last_nameが空ならNG' do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    it 'first_name_kanaが空ならNG' do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
    it 'last_name_kanaが空ならNG' do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end
    it 'birth_dateが空ならNG' do
      user = build(:user, birth_date: nil) 
      user.valid?
      expect(user.errors[:birth_date]).to include("can't be blank")
    end
  end
end
