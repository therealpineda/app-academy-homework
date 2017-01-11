class RenameNameColumnToPeople < ActiveRecord::Migration[5.0]
  def change
    change_column :people, :name, :string, null: false
  end
end
