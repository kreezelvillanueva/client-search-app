module ClientSearch
  class DuplicateFinder
    def self.find(clients)
      email_groups = clients.group_by(&:email)
      email_groups.select { |email, group| group.size > 1 }.map do |email, group|
        { email: email, clients: group.map(&:to_s) }
      end
    end
  end
end
