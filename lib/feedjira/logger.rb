module Feedjira
  class << self
    attr_writer :logger

    # Provides a global logger instance for Feedjira
    # If no logger is set by the user, a logger using STDOUT is provided
    def logger
      return @logger unless @logger.nil?
      @logger = ::Logger.new(Feedjira::Config::DEFAULTS[:logger_io])
      @logger.level = Feedjira::Config::DEFAULTS[:logger_level]
      @logger
    end
  end

  # Provide some convenience methods for logging
  # So the Progname mustn't be passed on every call
  # @example
  #   Feedjira::Logger.info { "My Info Message" }
  module Logger
    class << self
      def debug
        Feedjira.logger.debug('Feedjira') { yield }
      end

      def info
        Feedjira.logger.info('Feedjira') { yield }
      end

      def warn
        Feedjira.logger.warn('Feedjira') { yield }
      end

      def error
        Feedjira.logger.error('Feedjira') { yield }
      end

      def fatal
        Feedjira.logger.fatal('Feedjira') { yield }
      end

      # Log exceptions with message and backtrace in a common way
      # Exceptions will only be logged when severity level 'debug' is set
      def exception(e)
        Feedjira.logger.debug('Feedjira') do
          msg = block_given? ? "#{yield}\n" : ''
          msg + "Message: #{e.message}\n#{e.backtrace.join("\n ")}"
        end
      end
    end
  end
end
