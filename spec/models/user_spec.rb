require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'ニックネームが必須であること' do
      user = User.new(nickname: '', email: 'test@example.com', password: 'password123', password_confirmation: 'password123',
                      last_name_kanji: '山田', first_name_kanji: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birthday: Date.new(2000, 1, 1))
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが必須であること' do
      user = User.new(nickname: 'test', email: '', password: 'password123', password_confirmation: 'password123',
                      last_name_kanji: '山田', first_name_kanji: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birthday: Date.new(2000, 1, 1))
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性であること' do
      # 既存のユーザーを作成しておく
      existing_user = User.create(nickname: 'existing_user', email: 'test@example.com', password: 'password123',
                                  password_confirmation: 'password123', last_name_kanji: '山田', first_name_kanji: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birthday: Date.new(2000, 1, 1))

      # 同じメールアドレスを持つ新しいユーザーを作成
      user = User.new(nickname: 'new_user', email: 'test@example.com', password: 'password123',
                      password_confirmation: 'password123', last_name_kanji: '山田', first_name_kanji: '次郎', last_name_kana: 'ヤマダ', first_name_kana: 'ジロウ', birthday: Date.new(2001, 2, 3))

      user.valid?
      expect(user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスは、@を含む必要があること' do
      user = User.new(nickname: 'test', email: 'testexample.com', password: 'password123', password_confirmation: 'password123',
                      last_name_kanji: '山田', first_name_kanji: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birthday: Date.new(2000, 1, 1))
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが必須であること' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: '', password_confirmation: 'password123',
                      last_name_kanji: '山田', first_name_kanji: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birthday: Date.new(2000, 1, 1))
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは、6文字以上での入力が必須であること' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: 'pass1', password_confirmation: 'pass1',
                      last_name_kanji: '山田', first_name_kanji: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birthday: Date.new(2000, 1, 1))
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: 'password', password_confirmation: 'password',
                      last_name_kanji: '山田', first_name_kanji: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birthday: Date.new(2000, 1, 1))
      user.valid?
      expect(user.errors.full_messages).to include('Password is invalid')
    end

    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: 'password123',
                      password_confirmation: 'different_password123', last_name_kanji: '山田', first_name_kanji: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birthday: Date.new(2000, 1, 1))
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'お名前(全角)は、名字と名前がそれぞれ必須であること' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: 'password123', password_confirmation: 'password123',
                      last_name_kanji: '', first_name_kanji: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birthday: Date.new(2000, 1, 1))
      user.valid?
      expect(user.errors.full_messages).to include("Last name kanji can't be blank")
    end

    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: 'password123', password_confirmation: 'password123',
                      last_name_kanji: 'Yamada', first_name_kanji: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birthday: Date.new(2000, 1, 1))
      user.valid?
      expect(user.errors.full_messages).to include('Last name kanji is invalid')
    end

    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: 'password123', password_confirmation: 'password123',
                      last_name_kanji: '山田', first_name_kanji: '太郎', last_name_kana: '', first_name_kana: 'タロウ', birthday: Date.new(2000, 1, 1))
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: 'password123', password_confirmation: 'password123',
                      last_name_kanji: '山田', first_name_kanji: '太郎', last_name_kana: 'ﾔﾏﾀﾞ', first_name_kana: 'タロウ', birthday: Date.new(2000, 1, 1))
      user.valid?
      expect(user.errors.full_messages).to include('Last name kana is invalid')
    end

    it '生年月日が必須であること' do
      user = User.new(nickname: 'test', email: 'test@example.com', password: 'password123', password_confirmation: 'password123',
                      last_name_kanji: '山田', first_name_kanji: '太郎', last_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birthday: nil)
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
