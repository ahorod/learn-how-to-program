class Lesson < ActiveRecord::Base
  belongs_to :section

  validates :name, :presence => true
  validates :content, :presence => true

  scope(:not_learned, -> do
    where({:learned => false})
  end)

  # scope :search, -> (name) { where("name like ?", "%#{name}%")}

  def self.search(term)
    if term
      where("content Like ?", "%#{term}%").order('number')
    else
      order('number')
    end
  end

  def self.not_learned
    where(learned: false)
  end

  define_method(:next) do
    next_lesson = nil
    lessons = Lesson.all.order(:number)
    lessons.each() do |lesson|
      if lesson.number > self.number
        next_lesson = lesson
        break
      else
        next_lesson = self
      end
    end
    next_lesson
  end

  define_method(:previous) do
    previous_lesson = nil
    lessons = Lesson.all.order(number: :desc)
    lessons.each() do |lesson|
      if lesson.number < self.number
        previous_lesson = lesson
        break
      else
        previous_lesson = self
      end
    end
    previous_lesson
  end
end
