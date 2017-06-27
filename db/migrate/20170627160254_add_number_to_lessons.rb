class AddNumberToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column(:lessons, :number, :integer)
  end
end
