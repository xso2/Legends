class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :tweets

  validates :name, presence: true
  validates :age , presence: true
  validates :height , presence: true
  validates :weight , presence: true

end
