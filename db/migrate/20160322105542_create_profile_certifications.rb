class CreateProfileCertifications < ActiveRecord::Migration
  def change
    create_table :profile_certifications do |t|
			t.string :cert_year
			t.belongs_to :profile, index: true, foreign_key: true
			t.belongs_to :certification, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
