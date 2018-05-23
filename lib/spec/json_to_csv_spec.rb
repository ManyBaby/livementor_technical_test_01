require 'rspec'
require_relative '../json_to_csv'


RSpec.describe 'Livementor::JsonToCsv#convert' do
  it 'converts json file to csv' do
    sample_csv = File.new('./spec/sample_files/csv_sample.csv', 'r').read
    Livementor::JsonToCsv.new('./spec/sample_files/json_sample.json', './tmp/output.csv').convert
    output_csv = File.new('./tmp/output.csv', 'r').read
    expect(output_csv).to eq sample_csv
  end
end