# frozen_string_literal: true

class NumericParamsChecker
  class NumericParamError < StandardError
  end

  # checks if value entered is numeric
  def self.intchecker(subject)
    subject.to_s.to_i.to_s == subject.to_s

  end

  def self.perform(param_val1, param_val2 )
    unless intchecker(param_val1) &&  intchecker(param_val2)

      Rails.logger.info('Enter Numeric values')
      raise NumericParamError, 'Please enter numeric values as parameters'
    end
  end
end
