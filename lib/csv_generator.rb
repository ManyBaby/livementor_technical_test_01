require 'csv'
module Livementor
  class CsvGenerator
    attr_reader :headers

    def initialize(source, extract_headers = true)
      @extract_headers = extract_headers
      @source = source # flattened hash
      # This assumes that all input have the same structure
      # And that the first line is correct
      @headers = source[0].keys #extract first line keys as headers
      # TODO, refactor this code above because it is not really resilient
      # as it is based on assumptions.
      # Assumptions are where all the bugs come from ;-)
    end

    def generate
      CSV.generate(headers: @extract_headers, col_sep: ',', quote_char: '"') do |csv|
        csv << @headers
        @source.each do |line|
          csv_line = @headers.map do |col|
            line[col]
          end
          csv << csv_line
        end
      end
    end
  end
end