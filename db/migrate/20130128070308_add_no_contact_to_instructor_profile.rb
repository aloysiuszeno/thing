class AddNoContactToInstructorProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :instructor_profiles, :no_contact, :boolean
  end
end
