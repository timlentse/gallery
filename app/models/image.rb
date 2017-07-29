class Image < ApplicationRecord
  belongs_to :tag
  validates :title, presence: { message: '标题不能为空' }
  validates :url, presence: { message: '图片不能为空' }
end
