class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :location
      t.string :lang
      t.text :comment

      t.timestamps null: false
    end
  end
end
