class ContentPartner
  include ActiveModel::Model
  
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  attr_accessor :id, :name, :abbreviation, :url, :description, :logo, :logo_type, :resources, :user, :created_at
  validates :name, presence: true
  validates :description, presence: true
  validates :url, format: URI::regexp(%w[http https]), allow_blank: true
  # has_many :users, through: :content_partner_users
  $content_partner_repository = ContentPartnerRepository.new(index_name: :content_partners, type: :content_partner, klass: ContentPartner)
  $content_partner_repository.settings number_of_shards: 1 do
    mapping do
      indexes :id, type: :integer
      indexes :name, type: :string, analyzer: :keyword
    end
  end
  
  def to_hash
    @name
    @id
  end

end