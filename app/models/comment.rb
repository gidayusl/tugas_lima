class Comment < ApplicationRecord
  #name relation must singular
  before_create :default_status
  belongs_to :article
  validates :content, presence: true, length: { minimum: 10 }
  default_scope {where(status: 'active')}
  
  def default_status
      self.status = "active"
  end
end
