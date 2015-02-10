class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |x|
      x.string :text
      x.string :unique_id
      x.datetime :tweeted_time
      x.belongs_to :twitteruser
      x.timestamps
    end
  end
end
