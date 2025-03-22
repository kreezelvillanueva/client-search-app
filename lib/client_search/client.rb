require 'ostruct'

module ClientSearch
  class Client < OpenStruct
    def initialize(data)
      super(data)
    end

    def to_s
      attributes = to_h.map { |key, value| "#{key}: #{value}" }
      attributes.join(", ")
    end
  end
end
