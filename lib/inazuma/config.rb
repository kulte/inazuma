require 'active_support/configurable'

module Inazuma
  # Configures global settings for Inazuma
  #   Inazuma.configure do |config|
  #     config.default_per_page = 10
  #   end
  def self.configure(&block)
    yield @config ||= Inazuma::Configuration.new
  end

  # Global settings for Inazuma
  def self.config
    @config
  end

  # need a Class for 3.0
  class Configuration #:nodoc:
    include ActiveSupport::Configurable
    config_accessor :default_per_page
    config_accessor :max_per_page
    config_accessor :page_method_name
    config_accessor :max_pages
    config_accessor :add_link_headers

    def param_name
      config.param_name.respond_to?(:call) ? config.param_name.call : config.param_name
    end

    # define param_name writer (copied from AS::Configurable)
    writer, line = 'def param_name=(value); config.param_name = value; end', __LINE__
    singleton_class.class_eval writer, __FILE__, line
    class_eval writer, __FILE__, line
  end

  # this is ugly. why can't we pass the default value to config_accessor...?
  configure do |config|
    config.default_per_page = 25
    config.max_per_page = nil
    config.page_method_name = :page
    config.param_name = :page
    config.max_pages = nil
    config.add_link_headers = false
  end
end
