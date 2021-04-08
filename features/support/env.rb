require "capybara"
require "capybara/cucumber" 
require "selenium-webdriver"
require "faker"

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.default_max_wait_time = 15
  end

  
# if ENV['chrome']
#   Capybara.default_driver = :chrome
#   Capybara.register_driver :chrome do |app|
#     options = Selenium::WebDriver::Chrome::Options.new(args:
#     %w[incognito no-sandbox])
#     Capybara::Selenium::Driver.new(app,
#                                    browser: :chrome,
#                                    options: options,
#                                    driver_path: '../../chromedriver')  
                                       
#   end
#Capybara.default_driver = :selenium_chrome

# Capybara.configure do |config|
#     config.default_driver = :selenium
#     config.app_host = "https://magento2-b2b.magebit.com/"
# end


