module Feedjira
  class << self
    attr_writer :logger

    # Provides a global logger instance for Feedjira
    # If no logger is set by the user, a logger using STDOUT is provided
    def logger
      return @logger unless @logger.nil?
      @logger = Logger.new(STDOUT)
    end
  end
end
