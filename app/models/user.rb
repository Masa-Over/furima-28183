class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname, length: {maximum: 40}
          validates :birthday
          end
          with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
            validates :firstname
            validates :familyname
          end
          with_options presence: true, format: { with: /\A[ァ-ン一]+\z/, message: '全角カタカナを使用してください' } do
            validates :firstname_katakana
            validates :familyname_katakana
          end
          PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
          validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください', length: { minimum: 6}
  has_many :items
  has_many :purchase_records 
end
