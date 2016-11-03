class Url < ApplicationRecord
  validates :url, :presence => true
  has_many :url_content
end
