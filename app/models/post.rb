class Post < ActiveRecord::Base

	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true

	has_many :blogcomments, dependent: :destroy
	belongs_to :user

	def slug
    title.downcase.gsub(" ", "-")
  end

  def to_param
    "#{id}-#{slug}"
  end

end
