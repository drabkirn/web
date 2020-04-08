if Rails.env.development? or Rails.env.test?
  require "rubygems"
  require "selenium-webdriver"

  Selenium::WebDriver.logger.level = :debug
  Selenium::WebDriver.logger.output = '/tmp/selenium.log'
  ENV['DISPLAY']=':99.0'
end