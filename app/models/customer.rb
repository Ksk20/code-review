class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :people
  has_many :books, dependent: :destroy
  has_many :beginners, dependent: :destroy
  has_many :portraits, dependent: :destroy
  has_many :creations, dependent: :destroy
  has_many :favorites, dependent: :destroy


  enum is_member: {Available: true, Invalid: false}
  validates :is_member, inclusion: { in: ["Available", "Invalid"] }
  #有効会員はtrue、退会済み会員はfalse
   def active_for_authentication?
        super && (self.is_member === "Available")
   end
  #is_memberが有効の場合は有効会員(ログイン可能)

  validates :name,
	presence: true
end
