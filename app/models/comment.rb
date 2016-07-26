class Comment < ApplicationRecord
  #name relation must singular
  before_create :default_status
  belongs_to :article
  validates :content, presence: true, length: { minimum: 10 }
  
  before_create :default_status
  
  def default_status
      self.status = "off"
  end
end
