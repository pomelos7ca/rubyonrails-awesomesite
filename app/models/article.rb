class Article < ApplicationRecord
    has_many :comments,dependent: :destroy #设置删除关联对象
    validates :title,presence:true,length: { minimum:5 }
    validates :text,presence:true,length: { in:5..145 }
end
