module ClientSearch
  class Search
    def self.by_name(clients, query)
      clients.select { |client| client.full_name.downcase.include?(query.downcase) }
    end

    def self.by_conditions(clients, conditions)
      clients.select do |client|
        evaluate_conditions(client, conditions)
      end
    end

    def self.evaluate_conditions(client, conditions)
      result = conditions.first[:operator] == 'OR' ? false : true

      conditions.each do |condition|
        client_value = client.send(condition[:field])
        match = client_value && client_value.downcase.include?(condition[:value].downcase)

        if condition[:operator] == 'OR'
          result ||= match
        else
          result &&= match
        end
      end

      result
    end
  end
end
