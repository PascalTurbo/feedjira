# Feedjira::Config
module Feedjira
  def self.configure
    yield Config
  end

  # Provides global configuration options for Feedjira
  #
  # @example Set configuration options using a block
  #   Feedjira.configure do |config|
  #     config.logger = my_logger_instance
  #   end
  #
  # @example Set configuration options directly
  #   Feedjira::Config.logger = Logger.new('foo.log')
  module Config
    DEFAULTS = {
      logger_io: STDOUT,
      logger_level: Logger::WARN
    }.freeze

    class << self
      # Set the global logger
      # @see Feedjira::Logger
      #
      # @param logger [Logger] a ruby Logger
      #
      # @return [Logger]
      def logger=(logger)
        Feedjira.logger = logger
      end

      # Get the global logger
      # @see Feedjira::Logger
      #
      # @return [Logger]
      def logger
        Feedjira.logger
      end
    end
  end
end
