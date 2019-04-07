class CreatePhoneUsages < ActiveRecord::Migration[5.2]
    def change
      create_table :phone_usages do |t|
        t.references :user_result, foreign_key: true
        t.datetime :start_time
        t.datetime :end_time
      end
    end
  end
  