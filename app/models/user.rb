class User < ActiveRecord::Base
  has_many :comments
  has_many :posts

  has_many :post_votes

  has_attached_file :avatar, :styles => { medium: "300x300>", thumb: "100x100>", default_url: "/images/cat.jpg"}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
