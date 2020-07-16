class Portfolio < ApplicationRecord

  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :angular, -> { where(subtitle: 'Angular') }

  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }
end
