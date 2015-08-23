require_relative 'features/session_helpers'

RSpec.configure do |config|
  config.include Features::SessionHelpers, type: :feature
  config.include Features::DateHelpers, type: :feature
end
