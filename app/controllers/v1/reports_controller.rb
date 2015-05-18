module V1
  class ReportsController < ApplicationController
    skip_before_action :ensure_json_request, only: :new

    def new
      @report = File.read Rails.root.join('log', 'reporting.log')
      render text: @report
    end
  end
end
