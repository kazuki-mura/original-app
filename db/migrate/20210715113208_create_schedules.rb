class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string     :client,           null: false
      t.string     :person
      t.integer    :content_id,       null: false
      t.text       :aim
      t.string     :time 
      t.integer    :product_id,       null: false
      t.text       :report 
      t.text       :other
      t.integer    :response_id,      null: false
      t.references :user,             null: false, foreign_key: true
      t.datetime :start_time
      t.timestamps
    end
  end
end
