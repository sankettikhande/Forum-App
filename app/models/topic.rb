class Topic < ActiveRecord::Base
	
	extend FriendlyId

	belongs_to :forum
	has_many :comments

	friendly_id :subject, use: [:slugged, :history]
end
