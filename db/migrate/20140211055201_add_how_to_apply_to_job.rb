class AddHowToApplyToJob < ActiveRecord::Migration
  def change
  	add_column :jobs, :apply, :text
  end
end
