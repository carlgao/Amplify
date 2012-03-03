Wordnik.configure do |config|
  config.api_key = 'dde270d42ab86461b804d0f7dec00df24557a2d8090ad80ce'               # required
  #config.username = 'bozo'                    # optional, but needed for user-related functions
  #config.password = 'cl0wnt0wn'               # optional, but needed for user-related functions
  config.response_format = 'json'             # defaults to json, but xml is also supported
  config.logger = Logger.new('/dev/null')     # defaults to Rails.logger or Logger.new(STDOUT). Set to Logger.new('/dev/null') to disable logging.
end
