require 'rspec'
require_relative '../csv_generator'

RSpec.describe 'Livementor::CsvGenerator' do
  before do
    @array = [
      {
        key01: 'value01_01',
        key02: 'value02_01',
        key03: 'value03_01'
      },
      {
        key01: 'value01_02',
        key02: 'value02_02',
        key03: 'value03_02'
      }
    ]
  end

  context 'when all elements have the same structure' do
    it 'extracts headers from first row' do
      expect(Livementor::CsvGenerator.new(@array).headers).to eq [:key01, :key02, :key03]
    end
  end

  it 'outputs a csv string' do
    expect(Livementor::CsvGenerator.new(@array).generate).to eq "key01,key02,key03\nvalue01_01,value02_01,value03_01\nvalue01_02,value02_02,value03_02\n"
  end
  
  context 'when value contains commas' do
    it 'escapes them' do
      array_with_commas = [
        {
          key01: "value, with, commas",
          key02: 'value02_01',
          key03: 'value03_01'
        },
        {
          key01: 'value01_02',
          key02: 'value02_02',
          key03: 'value03_02'
        }
      ]
      expect(Livementor::CsvGenerator.new(array_with_commas).generate).to eq "key01,key02,key03\n\"value, with, commas\",value02_01,value03_01\nvalue01_02,value02_02,value03_02\n"
    end
  end
end