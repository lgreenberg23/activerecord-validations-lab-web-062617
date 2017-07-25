class Post < ActiveRecord::Base
	

	validates :title, presence: true
	validates :content, length: { minimum: 250 }
	validates :summary, length: { maximum: 250 }
	validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
	validate :validate_clickbait, if: :title

	def validate_clickbait
    	if ["Won't Believe", "Secret", "Top", "Guess"].none? {|phrase| self.title.include?(phrase)}
  			errors.add(:title, "make your title more annoying")
  		end
  	end

end

