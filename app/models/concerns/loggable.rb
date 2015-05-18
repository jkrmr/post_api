module Loggable
  extend ActiveSupport::Concern

  included do
    after_save :log_save_for_reporting
    before_destroy :log_destroy_for_reporting
  end

  def log_save_for_reporting
    ReportingLog.info "The \#{current_user} just saved #{attributes}"
  end

  def log_destroy_for_reporting
    ReportingLog.info "The \#{current_user} just deleted #{attributes}"
  end
end
