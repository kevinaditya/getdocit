class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :employer
      t.string :role
      t.text :description
      t.text :criteria
      t.integer :salary
      t.string :salary_type
      t.date :closed_date
      t.string :category
      t.integer :duration
      t.text :contact
      t.string :location
      t.integer :user_id

      t.timestamps
    end
    add_index :jobs, [:user_id, :created_at]
  end
end
