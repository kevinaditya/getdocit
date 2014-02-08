class AddContactPhoneContactEmail < ActiveRecord::Migration
	def change
		add_column :jobs, :contact_phone, :text
		add_column :jobs, :contact_email, :text
	end
end
