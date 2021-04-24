class Foreigner < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :japanese_level
  has_many :needs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英字と半角数字を両方含めてください'
  with_options presence: true do
    validates :name
    validates :gender
    validates :birthday
    validates :country_region
    validates :language
    validates :address
    validates :job
    validates :hobby
    validates :concern
    validates :welcome
    validates :free
  end
  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :japanese_level_id
  end
  belongs_to_active_hash :japanese_level
end
