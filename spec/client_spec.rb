require 'spec_helper'
require 'client_search/client'

RSpec.describe ClientSearch::Client do
  let(:data) { { id: 1, full_name: "John Doe", email: "john.doe@gmail.com" } }
  let(:client) { described_class.new(data) }

  describe '#initialize' do
    it 'initializes with given data' do
      expect(client.id).to eq(1)
      expect(client.full_name).to eq("John Doe")
      expect(client.email).to eq("john.doe@gmail.com")
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the client' do
      expect(client.to_s).to eq("id: 1, full_name: John Doe, email: john.doe@gmail.com")
    end
  end
end
