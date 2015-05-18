class ReportingLog
  def self.info(message=nil)
    @log ||= Logger.new Rails.root.join('log', 'reporting.log')
    @log.info(message) unless message.nil?
  end
end
