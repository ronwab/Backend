# frozen_string_literal: true

class SearchRecord
  class NoSearchResults < StandardError
  end

  def self.perform(table_name, search_params, field_name)
    search_record = table_name.where("#{field_name} LIKE ?", search_params)

    raise NoSearchResults, 'Record does not exists' if search_record.empty?

    search_record
  end
end
