class Section < ActiveRecord::Base
  has_many :lessons
  validates :name, :presence => true

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      all
    end
  end
end
