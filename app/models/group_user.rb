class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user
  
  after_destroy :destroy_comments
  
  private
  
  def destroy_comments
    self.user.comments.where(group: self.group).destroy_all
  end
end
