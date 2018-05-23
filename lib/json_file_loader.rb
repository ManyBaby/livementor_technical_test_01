require 'json'

module Livementor
  class JsonFileLoader
    def initialize(path)
      @path = path
    end

    def load
      JSON.parse(File.read(@path))
    end
  end
end