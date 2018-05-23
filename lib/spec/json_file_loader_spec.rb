require 'rspec'
require_relative '../json_file_loader'

RSpec.describe 'Livementor::JsonFileLoader' do
  context 'given path is correct' do
    it 'imports JSON object' do
      file = Livementor::JsonFileLoader.new('./spec/sample_files/json_sample.json').load
      expect(file.count).to eq(10)
      expect(file[9]['email']).to eq('bakerwatson@geekosis.com')
      expect(file.is_a? Array).to be true
    end
  end
  
  context 'given path is wrong' do
    it 'raises an error' do
      expect do
        Livementor::JsonFileLoader.new('./spec/sample_files/json_sampl.json').load
      end.to raise_error(Errno::ENOENT)
    end
  end
end