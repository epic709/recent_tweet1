class CreateTwitterusers < ActiveRecord::Migration
  def change
    create_table :twitterusers do |x|
      x.string :twitter_id
      x.timestamps
    end
  end
end
