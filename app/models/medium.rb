class Medium < ApplicationRecord
  has_many :pages, inverse_of: :medium
  has_many :attributions, as: :content
  
  enum subclass: [ :image, :video, :sound, :map, :js_map ]
  enum format: [ :jpg, :youtube, :flash, :vimeo, :mp3, :ogg, :wav ]
  enum mime_type: [ 'image/jpeg', 'text/html', 'text/plain', 'video/mp4', 'video/x-ms-wmv', 'video/mpeg', 'video/quicktime', 'video/x-flv', 'audio/mpeg', 'audio/x-wav' ]

  scope :images, -> { where(subclass: :image) }
  scope :videos, -> { where(subclass: :video) }
  scope :sounds, -> { where(subclass: :sound) }
end
