class Tag < ApplicationRecord
  has_many :images, dependent: :delete_all, validate: false
  validates :name, presence: { message: 'tag名称不能为空' }
  validates_associated :images, message: '图片不能为空'
end
