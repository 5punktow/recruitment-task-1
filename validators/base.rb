require_relative 'presenter'
require_relative 'numericality'

module Validators
  Validator = Struct.new :name

  module Base
    def self.included base
      base.class_eval do
        class_variable_set :@@validators, {}
        attr_reader :errors
      end
      base.extend ClassMethods
    end

    module ClassMethods
      def validates_presence_of *args
        validates_with Presence, args
      end

      def validates_numericality_of *args
        validates_with Numericality, args
      end

      def validates_with validator, attr_names
        attr_names.each do |attr_name|
          class_variable_get(:@@validators)[attr_name] ||= Set.new
          class_variable_get(:@@validators)[attr_name].add Validator.new(validator)
        end
      end
    end

    def valid?
      @errors = []
      self.class.class_variable_get(:@@validators).each do |attr_name, validators|
        validators.each do |validator|
          validator_instance = validator.name.instance
          next if validator_instance.valid? send(attr_name)
          @errors << "#{_localized_name(attr_name)} #{validator_instance.error}"
        end
      end
      @errors.empty? ? true : false
    end

    private

      def _localized_name attr_name
        I18n.t.try(:services).try(:attributes).try(self.class.name.downcase).try(attr_name) || attr_name
      end
  end
end
