require 'spec_helper'
require 'client_search/duplicate_finder'
require 'client_search/client'

RSpec.describe ClientSearch::DuplicateFinder do
  let(:clients) do
    [
      ClientSearch::Client.new(id: 1, full_name: "John Doe", email: "john.doe@gmail.com"),
      ClientSearch::Client.new(id: 2, full_name: "Jane Smith", email: "jane.smith@yahoo.com"),
      ClientSearch::Client.new(id: 3, full_name: "Alex Johnson", email: "alex.johnson@hotmail.com"),
      ClientSearch::Client.new(id: 4, full_name: "Michael Williams", email: "michael.williams@outlook.com"),
      ClientSearch::Client.new(id: 5, full_name: "Emily Brown", email: "emily.brown@aol.com"),
      ClientSearch::Client.new(id: 6, full_name: "William Davis", email: "william.davis@icloud.com"),
      ClientSearch::Client.new(id: 7, full_name: "Olivia Miller", email: "olivia.miller@protonmail.com"),
      ClientSearch::Client.new(id: 8, full_name: "James Wilson", email: "james.wilson@yandex.com"),
      ClientSearch::Client.new(id: 9, full_name: "Ava Taylor", email: "ava.taylor@mail.com"),
      ClientSearch::Client.new(id: 10, full_name: "Michael Brown", email: "michael.brown@inbox.com"),
      ClientSearch::Client.new(id: 11, full_name: "Sophia Garcia", email: "sophia.garcia@zoho.com"),
      ClientSearch::Client.new(id: 12, full_name: "Emma Lopez", email: "emma.lopez@protonmail.ch"),
      ClientSearch::Client.new(id: 13, full_name: "Liam Martinez", email: "liam.martinez@fastmail.fm"),
      ClientSearch::Client.new(id: 14, full_name: "Isabella Rodriguez", email: "isabella.rodriguez@me.com"),
      ClientSearch::Client.new(id: 15, full_name: "Another Jane Smith", email: "jane.smith@yahoo.com")
    ]
  end

  describe '.find' do
    it 'finds duplicate emails' do
      duplicates = described_class.find(clients)
      expect(duplicates).not_to be_empty
      expect(duplicates.first[:email]).to eq("jane.smith@yahoo.com")
      expect(duplicates.first[:clients].size).to eq(2)
    end

    it 'returns an empty array when there are no duplicates' do
      unique_clients = clients[0..13] # Remove the duplicate entry
      duplicates = described_class.find(unique_clients)
      expect(duplicates).to be_empty
    end
  end
end
