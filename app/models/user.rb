class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  # フォロー機能部分のアソシエーション
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: "Relationships", foregin_key: "follow_id"
  has_many :followers, through: :reverse_of_relationships,source: :user
  git 
  attachment :profile_image

  validates :name, length: {in: 2..20}, uniqueness: { case_sensitive: false }
  validates :introduction ,length: {maximum: 50}

end
