class AddLearnedToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column(:lessons, :learned, :boolean)
  end
end
