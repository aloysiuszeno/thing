class CreateAuthentications < ActiveRecord::Migration[5.1]
  def change
    create_table :authentications do |t|
      t.references :user  # this now adds index by default -scm
      t.string :provider
      t.string :uid
      t.string :oauth
      t.datetime :oauth_expires_at

      t.timestamps
    end
    #  add_index :authentications, :user_id # not needed in rails 5.1 -scm
  end
end
