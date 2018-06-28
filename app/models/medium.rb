class Medium < ApplicationRecord
  belongs_to :language
  
  has_many :pages, inverse_of: :medium
  has_many :attributions, as: :content
  has_many :references, as: :parent
  has_many :referents, through: :references
  
  enum subclass: [ :image, :video, :sound, :map, :js_map ]
  enum format: [ :jpg, :youtube, :flash, :vimeo, :mp3, :ogg, :wav ]
  enum mime_type: [ 'image/jpeg', 'text/html', 'text/plain', 'video/mp4', 'video/x-ms-wmv', 'video/mpeg', 'video/quicktime', 'video/x-flv', 'audio/mpeg', 'audio/x-wav' ]

  scope :images, -> { where(subclass: :image) }
  scope :videos, -> { where(subclass: :video) }
  scope :sounds, -> { where(subclass: :sound) }
  
  def is_image?
    subclass == "image"
  end

  def is_video?
    subclass == "video"
  end

  def is_sound?
    subclass == "sound"
  end

  def is_map?
    subclass == "map"
  end

  def is_js_map?
    subclass == "js_map"
  end
end
