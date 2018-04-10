
class GoodnessValidator < ActiveModel::Validator
  def validate(record)

    # good = true
    bad = ["Believe", "Secret", "Top", "Guess"]

    if record.title.instance_of? Post
    arr = record.title.split(' ')
    ans = arr.collect do |word|
      if !bad.include? word
        word
      end
    end

    # binding.pry

    if (ans.compact.size == arr.size)
    record.errors[:base] << "erro"
  end

end
#
  end
end


class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates_with GoodnessValidator

end
