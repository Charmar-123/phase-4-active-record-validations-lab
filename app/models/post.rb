class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)} 

    validate :custom_validator

    CLICKBAIT_WORDS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
      ]

    def custom_validator
        if CLICKBAIT_WORDS.none?{|word| word.match title}
            errors.add(:title, "Make more clickbaity!")
        end
    end

end
