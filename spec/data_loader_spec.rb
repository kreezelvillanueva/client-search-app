require 'spec_helper'

RSpec.describe ClientSearch::DataLoader do
  let(:file_path) { File.expand_path('../../data/clients.json', __FILE__) }
  let(:clients) { described_class.load_clients(file_path) }

  describe '.load_clients' do
    it 'loads clients from the JSON file' do
      expect(clients).not_to be_empty
      expect(clients.first).to be_a(ClientSearch::Client)
    end
  end
end