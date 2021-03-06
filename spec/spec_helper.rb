unless RUBY_VERSION.to_s < '1.9.0'
  require 'simplecov'
  SimpleCov.command_name('cuke_cataloger-cucumber')
end


require 'cuke_cataloger'


RSpec.configure do |config|
  config.before(:all) do
    here = File.dirname(__FILE__)
    @default_file_directory = "#{here}/temp_files"
    @default_test_file_directory = "#{here}/test_files"
  end

  config.before(:each) do
    FileUtils.mkpath(@default_file_directory)
  end

  config.after(:each) do
    FileUtils.remove_dir(@default_file_directory, true)
  end
end
