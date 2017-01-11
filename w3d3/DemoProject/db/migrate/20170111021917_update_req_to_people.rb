class UpdateReqToPeople < ActiveRecord::Migration[5.0]
  def change
    rename_table :people_tables, :people
    end
end
