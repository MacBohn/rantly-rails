class Rant < ActiveRecord::Base

  belongs_to :user

  validates_length_of :body, :minimum => 144, :allow_blank => false

  validates :title, presence: :true
  validates :search, presence: :true


def self.search(search)
    search_condition = "%" + search + "%"
end



end
