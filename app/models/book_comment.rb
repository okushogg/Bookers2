class BookComment < ApplicationRecord
  validates :comment, presence:true,
                      length: {in: 1..200}
  
  belongs_to :user
  belongs_to :book
end
