# frozen_string_literal: true

class StringValidator < ActiveModel::Validator
  def validate(record)
    check_string = record.activity
    if check_string.match?(/[0-9]/)
      record.errors[:activities] << 'must be a string'
    end
  end
end
