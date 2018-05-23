require 'rspec'
require_relative '../hash_flattener'

RSpec.describe 'Hash#flatten' do
  context 'when the hash is deeply nested' do
    before do
      @hash = {key01: ['string01', 'string02', 'string03'], key02: { child01: 'value child01', child02: { grand_child01: 'value grand_child01' } } }
    end
    it 'flattens the structure' do
      expect(@hash.flatten).to eq({key01: 'string01, string02, string03', 'key02.child01': 'value child01', 'key02.child02.grand_child01': 'value grand_child01'})
    end

    it 'joins the keys with dots' do
      expect(@hash.flatten.keys.include?(:'key02.child02.grand_child01')).to be true
    end

    it 'transforms array of string to string with commas' do
      expect(@hash.flatten[:key01]).to eq 'string01, string02, string03'
    end
  end
end