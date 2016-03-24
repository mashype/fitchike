class AddCertTitleToCertifications < ActiveRecord::Migration
  def change
  	add_column :certifications, :cert_name, :string
  end
end
