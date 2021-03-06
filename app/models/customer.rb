class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :people
  has_many :books, dependent: :destroy
  has_many :portraits, dependent: :destroy
  has_many :creations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  attachment :image

  enum is_member: {Available: true, Invalid: false}
  validates :is_member, inclusion: { in: ["Available", "Invalid"] }
  #有効会員はtrue、退会済み会員はfalse
   def active_for_authentication?
        super && (self.is_member === "Available")
   end
  #is_memberが有効の場合は有効会員(ログイン可能)

  validates :name,
	presence: true

  after_create :send_welcome_mail
  def send_welcome_mail
    CustomerMailer.customer_welcome_mail(self).deliver
  end

end
