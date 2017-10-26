class Article < ApplicationRecord
    validates :title,presence:true,length: { minimum:5 }
    validates :text,presence:true,length: { in:5..145 }
end
