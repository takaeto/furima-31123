require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録ができるとき" do

      it "nickname, last_name, first_name, last_name_kana, first_name_kana, birth_date, password, password_confirmation, emailが存在すれば登録できる" do
      expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
      @user.password = "abc123"
      @user.password_confirmation = "abc123"
      expect(@user).to be_valid
      end
      it "passwordが英数字である場合は登録できる" do
      @user.password = "abc123"
      @user.password_confirmation = "abc123"
      @user.valid?
      expect(@user).to be_valid
      end
      it "emailが@を含んでいる場合は登録できる" do
      @user.email ="xxx@mail.com"
      @user.valid?
      expect(@user).to be_valid
      end
      it "last_nameが全角である場合は登録できる" do
      @user.last_name = "鈴木"
      @user.valid?
      expect(@user).to be_valid
      end
      it "first_nameが全角である場合は登録できる" do
      @user.first_name = "亜久里"
      @user.valid?
      expect(@user).to be_valid
      end
      it "first_name_kanaが全角カタカナである場合は登録できる" do
      @user.first_name_kana = "アグリ"
      @user.valid?
      expect(@user).to be_valid
      end
      it "last_name_kanaが全角カタカナである場合は登録できる" do
      @user.last_name_kana = "スズキ"
      @user.valid?
      expect(@user).to be_valid
      end
    end


    context "新規登録ができないとき" do

      it "nicknameが空では登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "last_nameが空では登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_nameが空では登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "birth_dateが空では登録できない" do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

      it "passwordが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが5文字以下では登録できない" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが英数字でない場合は登録できない" do
      @user.password = "ああああああ"
      @user.password_confirmation = "ああああああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password please type using half-width characters")
      end

      it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "last_nameが全角でない場合は登録できない" do
      @user.last_name = "ｽｽﾞｷ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is Full-width characters")
      end

      it "first_nameが全角でない場合は登録できない" do
      @user.first_name = "ｱｸﾞﾘ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is Full-width characters")
      end

      it "last_name_kanaが全角でない場合は登録できない" do
      @user.last_name_kana = "ｽｽﾞｷ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is Full-width characters")
      end

      it "last_name_kanaがカタカナでない場合は登録できない" do
      @user.last_name_kana = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is Full-width characters")
      end

      it "first_name_kanaが全角でない場合は登録できない" do
      @user.first_name_kana = "ｱｸﾞﾘ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is Full-width characters")
      end

      it "first_name_kanaがカタカナでない場合は登録できない" do
      @user.first_name_kana = "agiri"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is Full-width characters")
      end
    end
  end
end
