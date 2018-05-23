require 'rspec'
require_relative '../json_to_csv'


RSpec.describe 'Livementor::JsonToCsv#convert' do
  it 'converts json file to csv' do
    sample_csv = File.new(File.expand_path('sample_files/csv_sample.csv', File.dirname(__FILE__)), 'r').read
    Livementor::JsonToCsv.new(File.expand_path('sample_files/json_sample.json', File.dirname(__FILE__)), File.expand_path('../tmp/output.csv', File.dirname(__FILE__))).convert
    output_csv = File.new(File.expand_path('../tmp/output.csv', File.dirname(__FILE__)), 'r').read
    expect(output_csv).to eq sample_csv
  end
end