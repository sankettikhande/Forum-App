class Like < ActiveRecord::Base
	def self.get_like_count(likeable_type,likeable_id)
      self.where(likeable_id:likeable_id,likeable_type:likeable_type).count
	end

end
