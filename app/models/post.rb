class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbait?

  def clickbait
    CLICKBAIT=["Won't Believe", "Secret", /Top [0..1]/, "Guess"]
    flag=true
    CLICKBAIT.each do |item|
      if self.title.contain?(item) flag=false
    end
    return flag
  end
end
