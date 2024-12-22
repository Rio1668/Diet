class Group < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
  validates :body, presence: true
  
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :comments, dependent: :destroy
  
  after_create :join_group
  
  private
  
  def join_group
    self.user.group_users.find_or_create_by(group: self)
  end
end
