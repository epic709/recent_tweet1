get '/' do
  # Look in app/views/index.erb

# client = Twitter::REST::Client.new do |config|
#   config.consumer_key        = "GNJdHPoOPsqOOhdyILWPq49ou"
#   config.consumer_secret     = "Hobvm4TLYbUtsaWf6LoVHU5J8Tlq2EWbzN7OrZ7yjwuE15C1QS"
#   config.access_token        = "718167336-uguDm3JUp2iSDiHiGjYSlRTzRF2YL3TTuQyyUqS0"
#   config.access_token_secret = "W3wPBhcpBpXHlxIxF41848cvMGxKt8ijsQlxHcyHHxrXg"
# end

array = CLIENT.user_timeline('LOHwillie', options = {count:5})
array.each do |t|
  p t.text
end

# topics = ["coffee", "tea"]
# client.filter(:track => topics.join(",")) do |obj|
#     puts obj.text if obj.is_a?(Twitter::Tweet)
#   end

  erb :index
end
