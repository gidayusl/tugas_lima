class Article < ApplicationRecord
  validates :title, presence: true,
    length: { minimum: 5 }
  validates :content, presence: true,
    length: { minimum: 10 }
  validates :status, presence: true

  default_scope {where(status: 'active')}

  has_attached_file :picture, #styles: {thumb: "100x100#"},
    url: "/upload_images/:basename.:extension",
    default_url: "/assets/missing.png"
  validates_attachment :picture,
    content_type: { content_type: /\Aimage\/.*\Z/ },size: { in: 0..200.kilobytes }
  # validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  #name relation must plural
  has_many :comments, dependent: :destroy
end
