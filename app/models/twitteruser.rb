class Twitteruser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def fetch_tweets!(since_id=1, max_id)
    array = []
    CLIENT.user_timeline(self.twitter_id, options = {since_id: since_id, max_id: max_id}).each do |t|
      array << self.tweets.create(text: t.text, tweeted_time: t.attrs[:created_at], unique_id: t.attrs[:id])
    end
  end

  def tweets_stale?(since_id, max_id)
    # CLIENT.user(self.twitter_id).tweets_count > self.tweets_count
    since_id.to_i < max_id
  end
end
