class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string     :client,           null: false
      t.string     :person
      t.integer    :content_id,       null: false
      t.text       :aim
      t.datetime   :starting_time 
      t.datetime   :ending_time 
      t.integer    :product_id,       null: false
      t.text       :report 
      t.text       :other
      t.references :user,             null: false, foreign_key: true
      t.datetime   :start_time
      t.datetime   :visit_date,       null: false
      t.timestamps
    end
  end
end
