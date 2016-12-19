module Validators
  class Numericality
    include Singleton

    def valid? val
      val.is_a?(Numeric) ? true : false
    end

    def error
      I18n.t.validators.errors.messages.not_a_number
    end
  end
end
