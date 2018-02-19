class RegenerateUserAccessTokens < ActiveRecord::Migration[5.1]
  def up
    User.find_each do |user|
      user.regenerate_access_token
      user.save!
    end
  end

  def down
  end
end
