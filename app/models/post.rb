class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :clickbait?

CLICKBAIT=[/Won't Believe/, /Secret/, /Top [0..1]/, /Guess/]
  def clickbait?
    flag=true
    CLICKBAIT.each do |item|
      if self.title.include?(item)
        flag=false
      end
    end
    return flag
  end
end
