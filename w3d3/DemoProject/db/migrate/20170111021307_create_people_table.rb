class CreatePeopleTable < ActiveRecord::Migration[5.0]
  def change
    create_table :people_tables do |t|
      t.string :name
      t.integer :house_id
      t.datetime  :created_at
      t.datetime  :updated_at
    end
  end
end
