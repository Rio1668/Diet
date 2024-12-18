class Group < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
  validates :body, presence: true
  
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :comments, dependent: :destroy
end
