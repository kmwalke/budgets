module ErrorReporter
  def report_error(error: nil, handled: nil, severity: nil, context: nil, source: nil)
    back_trace_string = ''
    error.backtrace.each do |l|
      back_trace_string << "\n #{l}"
    end

    AppError.create(ae_error: error, ae_handled: handled, ae_backtrace: back_trace_string, ae_severity: severity,
                    ae_source: source, ae_context: context)
  end
end
