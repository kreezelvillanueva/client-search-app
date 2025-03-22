require 'json'
require_relative 'client'

module ClientSearch
  class DataLoader
    DEFAULT_FILE_PATH = File.expand_path('../../../data/clients.json', __FILE__)

    def self.load_clients(file_path = nil)
      file_path ||= DEFAULT_FILE_PATH
      file = File.read(file_path)
      JSON.parse(file, symbolize_names: true).map do |client_data|
        Client.new(client_data)
      end
    end
  end
end
