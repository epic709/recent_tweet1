get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  # Look in app/views/index.erb

  @user = Twitteruser.find_by_twitter_id(params[:username])
  max_id = CLIENT.user(params[:username]).attrs[:status][:id]
  if @user.tweets == []
    since_id = 1
  else
    since_id = @user.tweets.select('MAX(unique_id) AS since_id').first.since_id
  end

  if @user.tweets_stale?(since_id, max_id)
    # User#fetch_tweets! should make an API call
    # and populate the tweets table
    # Future requests should read from the tweets table
    # instead of making an API call
    @user.fetch_tweets!(since_id, max_id)
  end

  @array = @user.tweets.order('tweeted_time desc')

  erb :index
end
