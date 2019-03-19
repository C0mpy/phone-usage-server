class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :title
      t.text :description
      t.boolean :is_active

      t.timestamps
    end
  end
end
