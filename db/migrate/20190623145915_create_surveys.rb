class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :title
      t.text :description
      t.references :interval, foreign_key: true

      t.timestamps
    end
  end
end
