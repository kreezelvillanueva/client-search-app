require 'spec_helper'
require 'thor'
require 'stringio'

RSpec.describe ClientSearch::CLI do
  let(:cli) { described_class.new }
  let(:file_path) { File.expand_path('../../data/clients.json', __FILE__) }

  describe '#search' do
    it 'searches clients by query' do
      expect {
        cli.invoke(:search, [], { query: 'full_name:John', data_file: file_path })
      }.to output(/Search results:/).to_stdout
    end
  end

  describe '#duplicates' do
    it 'finds duplicate emails' do
      expect {
        cli.invoke(:duplicates, [], { data_file: file_path })
      }.to output(/Duplicate email:/).to_stdout
    end
  end
end