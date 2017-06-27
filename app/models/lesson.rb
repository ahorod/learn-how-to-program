class Lesson < ActiveRecord::Base
  validates :name, :presence => true
  validates :content, :presence => true

  define_method(:next) do
    next_number = self.number + 1
    next_lesson = nil
    lessons = Lesson.all
    lessons.each() do |lesson|
      if lesson.number = next_number
        next_lesson = lesson
      end
    end
    next_lesson
  end
end
