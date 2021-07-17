class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string     :client,        null: false
      t.string     :person
      t.integer    :content,       null: false
      t.text       :aim
      t.string     :time 
      t.integer    :product,       null: false
      t.text       :report 
      t.text       :other
      t.integer    :response,      null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
