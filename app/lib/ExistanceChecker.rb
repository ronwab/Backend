# frozen_string_literal: true

class ExistanceChecker
  class ExistanceError < StandardError
  end
  def self.perform(search_params, table_name, field_name)
    record_check = table_name.where(" #{field_name} = ?", search_params).first
    unless record_check.nil?
      raise ExistanceError, "Record with name #{search_params} of type #{table_name} already exists"
      Rails.logger.info("Record with name #{search_params} of type #{table_name} already exists")
    end
  end
end
