class Pin < ApplicationRecord
	belongs_to :user
	has_one_attached :image_header

	def show
		metadata = ActiveStorage::Analyzer::ImageAnalyzer::ImageMagick.new(image_header).metadata
		width, height = metadata[:width], metadata[:height]

		if width > 600 || height > 800
			self.image_header.variant(resize_to_fit: [500, 500]).processed;
		else
			self.image_header;
		end
	end

	def thumbnail
		# metadata = ActiveStorage::Analyzer::ImageAnalyzer::ImageMagick.new(image_header).metadata
		# width, height = metadata[:width], metadata[:height]

		# if width < 300 && height < 300
			# return self.image_header.variant(resize_to_limit: [400, 400]);
			# return self.image_header.variant(resize: 1.1);
		# else


		# processed: not to resize everytime
		self.image_header.variant(resize_to_fit: [100, 100]).processed;
	end

	# def author
	# 	user_id = ActiveStorage::Analyzer::ImageAnalyzer::ImageMagick.new(image_header).blob.record.user_id
	# 	author = User.find(user_id).name
	# rescue
	# 	"Unknown"
	# end
end