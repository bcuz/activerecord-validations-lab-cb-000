
class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    bad = ["Won't Believe", "Secret", "Top", "Guess"]
    if !bad.include? record.title
      record.errors[:base] << "erro"
    end
  end
end


class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates_with GoodnessValidator

end
