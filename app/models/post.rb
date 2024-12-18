class Post < ApplicationRecord
  belongs_to :user
  has_many :menus, dependent: :destroy
  accepts_nested_attributes_for :menus, allow_destroy: true, reject_if: :all_blank
end
