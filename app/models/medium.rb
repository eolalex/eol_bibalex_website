class Medium < ApplicationRecord
  
  searchkick
  belongs_to :language
  belongs_to :location, optional: true
  belongs_to :license
  belongs_to :bibliographic_citation, optional: true
  
  has_many :pages, inverse_of: :medium
  has_many :attributions, as: :content
  has_many :page_contents, as: :content
  has_many :references, as: :parent
  
  enum subclass: [ :image, :video, :sound, :map, :js_map ]
  enum format: [ :jpg, :youtube, :flash, :vimeo, :mp3, :ogg, :wav, 'audio/mpeg ', 'audio/ogg' , 'audio/x-wav' , 'video/ogg', 'video/mp4', 'video/x-ms-wmv',
     'video/mpeg', 'video/quicktime', "video/webm", 'video/x-flv' , 'image/jpeg' , "image/gif" , 'image/png' , 'image/tiff' , 'image/svg+xml']
  # enum mime_type: [ 'text/html', 'text/plain', 'video/mp4', 'video/x-ms-wmv', 'video/mpeg', 'video/quicktime', 'video/x-flv', 'audio/mpeg', 'audio/x-wav' ]

  scope :images, -> { where(subclass: :image) }
  scope :videos, -> { where(subclass: :video) }
  scope :sounds, -> { where(subclass: :sound) }

  validates_uniqueness_of :id
  

  def search_data
    {
        id: id,
        ancestry_ids: ancestry_ids 
    }
  end
  
  def ancestry_ids
      page_contents.pluck(:page_id)
  end
  
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


