module Validators
  class Presence
    include Singleton

    def valid? val
      val ? true : false
    end

    def error
      I18n.t.validators.errors.messages.blank
    end
  end
end
