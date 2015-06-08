require 'haml'
require 'sprockets'
require 'sprockets/engines'

module Hamlbars

  if defined? Rails::Engine
    class Engine < Rails::Engine
    end
  end

  ROOT = File.expand_path(File.dirname(__FILE__))

  autoload :Ext,      File.join(ROOT, 'hamlbars', 'ext')
  autoload :Template, File.join(ROOT, 'hamlbars', 'template')

  Haml::Compiler.send(:include, Ext::Compiler)

  if defined? Sprockets
    Sprockets.register_engine '.hamlbars', Template
  end

end
