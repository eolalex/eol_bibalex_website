class ContentPartnerUser < ActiveRecord::Base
  belongs_to :user
  # belongs_to :content_partner, foreign_key: "content_partner_id", class_name: "ContentPartner"
end
