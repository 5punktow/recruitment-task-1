require 'set'
require 'singleton'
require 'yaml'
require 'ostruct'
require 'json'

require_relative 'core_ext/object/try'
require_relative 'lib/i18n'
require_relative 'validators/base'

# TASK: Implement this class to make tests pass
class BaseClass
  include Validators::Base
end
