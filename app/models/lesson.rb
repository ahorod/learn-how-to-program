class Lesson < ActiveRecord::Base
  validates :name, :presence => true
  validates :content, :presence => true

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
