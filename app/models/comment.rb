class Comment < ApplicationRecord
  #name relation must singular
  belongs_to :article
  default_scope {where(status: 'active')}
end
