class I18n
  include Singleton

  attr_reader :locale

  def initialize
    self.locale = 'en'
  end

  class << self
    def locale
      instance.locale
    end

    def locale= val
      instance.locale = val
    end

    def t
      instance.t
    end
  end

  def locale= val
    @locale = val
    fetch_translation
    @locale
  end

  def t
    @translation
  end

  private

    def locales_path
      File.join File.dirname(__FILE__), '..', 'locales'
    end

    def current_locale_path
      File.join locales_path, "#{locale}.yml"
    end

    def fetch_translation
      hash = YAML.load File.open current_locale_path
      os = JSON.parse hash.to_json, object_class: OpenStruct
      @translation = os[locale]
    end
end
