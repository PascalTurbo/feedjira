module Feedjira
  # Set configuration options by block
  # Feedjira.configure do |config|
  #   config.logger = my_logger_instance
  # end

  def self.configure
    yield Config
  end

  module Config
    DEFAULTS = {
      logger_io: STDOUT,
      logger_level: Logger::WARN
    }.freeze

    class << self
      def logger=(logger)
        Feedjira.logger = logger
      end

      def logger
        Feedjira.logger
      end
    end
  end
end
