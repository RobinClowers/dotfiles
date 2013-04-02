require 'pry-debugger'
require 'pry-coolline'
require 'pry-stack_explorer'

Pry.config.prompt = [ proc { ">> " }, proc { ">? " } ]
Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 'f', 'finish'

class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end

# loading rails configuration if it is running as a rails console
load File.dirname(__FILE__) + '/.pryrc_rails' if defined?(Rails) && Rails.env
