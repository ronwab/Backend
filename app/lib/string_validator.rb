# frozen_string_literal: true

class StringValidator < ActiveModel::Validator
  def validate(record)
    check_string = record.activity
    if check_string.match?(/[0-9]/)
      record.errors[:activities] << 'must be a string'
    end
    # record.errors[:users] << "Name is too short" if check_name.match?(/^\w{0,3}$/)
  end
end
