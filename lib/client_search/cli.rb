require 'thor'
require_relative 'data_loader'
require_relative 'search'
require_relative 'duplicate_finder'

module ClientSearch
  class CLI < Thor
    desc "search", "Search clients by query string (e.g., 'full_name:John AND email:gmail.com')"
    method_option :query, aliases: "-q", type: :string, required: true, desc: "Query string to search clients"
    method_option :data_file, aliases: "-d", type: :string, desc: "Path to the clients JSON file"
    def search
      clients = DataLoader.load_clients(options[:data_file])
      conditions = parse_query(options[:query])
      results = Search.by_conditions(clients, conditions)
      puts "Search result:"
      results.each do |result|
        puts "  - #{result}"
      end
    end

    desc "duplicates", "Find duplicate emails"
    method_option :data_file, aliases: "-d", type: :string, desc: "Path to the clients JSON file"
    def duplicates
      clients = DataLoader.load_clients(options[:data_file])
      duplicates = DuplicateFinder.find(clients)
      duplicates.each do |duplicate|
        puts "Duplicate email: #{duplicate[:email]}"
        duplicate[:clients].each do |client|
          puts "  - #{client}"
        end
      end
    end

    private

    def parse_query(query)
      conditions = []
      if query.include?(' AND ') || query.include?(' OR ')
        query.split(/ AND | OR /i).each do |condition|
          field, value = condition.include?(':') ? condition.split(':') : ['full_name', condition]
          operator = query.include?(' AND ') ? 'AND' : 'OR'
          conditions << { field: field.strip, value: value.strip, operator: operator }
        end
      else
        field, value = query.include?(':') ? query.split(':') : ['full_name', query]
        conditions << { field: field.strip, value: value.strip, operator: 'AND' }
      end
      conditions
    end
  end
end
