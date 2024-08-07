Rails.application.config.after_initialize do
  include ErrorReporter
end

class ErrorSubscriber
  def report(error, handled:, severity:, context:, source: nil)
    ErrorReporter.report_error(error:, handled:, severity:, context:, source:)
  end
end
Rails.error.subscribe(ErrorSubscriber.new)
