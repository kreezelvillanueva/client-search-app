require 'spec_helper'
require 'client_search/search'
require 'client_search/client'

RSpec.describe ClientSearch::Search do
  let(:clients) do
    [
      ClientSearch::Client.new(id: 1, full_name: "John Doe", email: "john.doe@gmail.com"),
      ClientSearch::Client.new(id: 2, full_name: "Jane Smith", email: "jane.smith@yahoo.com"),
      ClientSearch::Client.new(id: 3, full_name: "Alex Johnson", email: "alex.johnson@hotmail.com"),
      ClientSearch::Client.new(id: 4, full_name: "Michael Williams", email: "michael.williams@outlook.com"),
      ClientSearch::Client.new(id: 5, full_name: "Emily Brown", email: "emily.brown@aol.com")
    ]
  end

  describe '.by_conditions' do
    it 'finds clients by full_name' do
      conditions = [{ field: 'full_name', value: 'John', operator: 'AND' }]
      results = described_class.by_conditions(clients, conditions)
      expect(results.size).to eq(2)
      expect(results.map(&:full_name)).to contain_exactly("John Doe", "Alex Johnson")
    end

    it 'finds clients by email' do
      conditions = [{ field: 'email', value: 'gmail.com', operator: 'AND' }]
      results = described_class.by_conditions(clients, conditions)
      expect(results.size).to eq(1)
      expect(results.first.email).to eq("john.doe@gmail.com")
    end

    it 'finds clients by multiple conditions with AND' do
      conditions = [
        { field: 'full_name', value: 'John', operator: 'AND' },
        { field: 'email', value: 'gmail.com', operator: 'AND' }
      ]
      results = described_class.by_conditions(clients, conditions)
      expect(results.size).to eq(1)
      expect(results.first.full_name).to eq("John Doe")
    end

    it 'finds clients by multiple conditions with OR' do
      conditions = [
        { field: 'full_name', value: 'John', operator: 'OR' },
        { field: 'email', value: 'yahoo.com', operator: 'OR' }
      ]
      results = described_class.by_conditions(clients, conditions)
      expect(results.size).to eq(3)
      expect(results.map(&:full_name)).to contain_exactly("John Doe", "Alex Johnson", "Jane Smith")
    end

    it 'returns an empty array when no clients match the conditions' do
      conditions = [{ field: 'full_name', value: 'Nonexistent', operator: 'AND' }]
      results = described_class.by_conditions(clients, conditions)
      expect(results).to be_empty
    end
  end
end
