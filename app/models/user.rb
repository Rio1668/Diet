class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :joined_groups, through: :group_users, source: :group
  has_many :comments, dependent: :destroy
  
  def join_group(group)
    self.group_users.find_or_create_by(group: group)
  end
  
  def detach_group(group)
    self.group_users.find_by(group: group)&.destroy
  end
  
  def join_group?(group)
    self.joined_groups.include?(group)
  end
  
  def self.guest_log_in
    user = User.find_or_initialize_by(email: 'guest@guest.com')
    if user.new_record?
      user.assign_attributes(
          name: 'ゲスト'
      )
    end
    user.password = SecureRandom.hex(10)
    user.save
    user
  end
end
