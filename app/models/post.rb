class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 100}
  validates :summary, length: {maximum: 299}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  validate :click_bait

  def click_bait
    if title != nil && !title.start_with?('Won\'t Believe', 'Secret', 'Top', 'Guess', "You Won\'t")
      errors.add(:title, "Not clickbait title")
  end
end

end
