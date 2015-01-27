class HistoricalRecordsController < ApplicationController
  def index
    @records = HistoricalRecord.all
  end
end
