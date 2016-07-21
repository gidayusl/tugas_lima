class Comment < ApplicationRecord
  #name relation must singular
  belongs_to :article
end
