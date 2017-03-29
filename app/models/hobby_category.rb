class HobbyCategory < ApplicationRecord
  belongs_to :hobby
  belongs_to :category
end
