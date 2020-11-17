class Book < ApplicationRecord
  validates :opinion, presence:true
  validates :title, presence:true
  
  belongs_to :user 
end
