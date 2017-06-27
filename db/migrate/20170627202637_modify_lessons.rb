class ModifyLessons < ActiveRecord::Migration[5.1]
  def change
    add_column(:lessons, :section_id, :integer)
  end
end
