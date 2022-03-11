class Pin < ApplicationRecord
	belongs_to :user
	has_one_attached :image_header

	def show
		return self.image_header;
	end

	def thumbnail
		# metadata = ActiveStorage::Analyzer::ImageAnalyzer::ImageMagick.new(image_header).metadata
		# width, height = metadata[:width], metadata[:height]

		# if width < 300 && height < 300
			# return self.image_header.variant(resize_to_limit: [400, 400]);
			# return self.image_header.variant(resize: 1.1);
		# else
		return self.image_header#.variant(resize_to_fit: [300, 300]);
	end
end