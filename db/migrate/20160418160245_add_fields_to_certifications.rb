class AddFieldsToCertifications < ActiveRecord::Migration
  def change
    add_column :certifications, :cert_abbreviation, :string
    add_column :certifications, :website, :string
    add_column :certifications, :cert_description, :text
  end
end
