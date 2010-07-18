module DataMapper
  module EmbeddedValue
    include DataMapper::Assertions
    extend Chainable
    extend Deprecate

    def self.included(model)
      model.extend Model
    end
  end
end
