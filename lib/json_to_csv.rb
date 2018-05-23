require_relative './csv_generator.rb'
require_relative './hash_flattener.rb'
require_relative './json_file_loader.rb'

module Livementor
  class JsonToCsv
    def initialize(input, output)
      @input = input
      @output = output
    end

    def convert
      f = File.new(@output, 'w')
      csv_string = CsvGenerator.new(JsonFileLoader.new(@input).load.map(&:flatten)).generate
      f.write(csv_string)
      f.close
      csv_string
    end
  end
end