class CreateUserResults < ActiveRecord::Migration[5.2]
  def change
    create_table :user_results do |t|
      t.references :survey_result, foreign_key: true
      t.string :user_uuid
      t.integer :time_spent_on_phone
      t.datetime :period_start
      t.datetime :period_end
    end
  end
end
