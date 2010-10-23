module DataMapper
  module EmbeddedValue
    include DataMapper::Assertions
    extend Chainable
    extend Deprecate

    def self.included(model)
      model.extend Model
    end

    # TODO: shared with Resource
    def properties
      model.properties(repository_name)
    end
  end
end
