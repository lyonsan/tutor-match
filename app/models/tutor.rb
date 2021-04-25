class Tutor < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :japanese_level
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
    validates :motivation
  end
end
