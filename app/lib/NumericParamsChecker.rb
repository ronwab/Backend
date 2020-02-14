class NumericParamsChecker
  class NumericParamError < StandardError
  end

  def self.perform(param_val)
    unless param_val.is_a? Numeric
      Rails.logger.info("Enter Numeric values")
      raise NumericParamError, "Please enter numeric values as parameters"
    end
  end
end