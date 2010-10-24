module DataMapper
  module EmbeddedValue
    include DataMapper::Assertions
    extend Chainable
    extend Deprecate

    # @api public
    # TODO: shared with Resource
    alias_method :model, :class

    def self.included(model)
      model.extend Model
    end

    # TODO: shared with Resource
    def properties
      model.properties(repository_name)
    end

    # TODO: implement me
    def save
      execute_hooks_for(:before, :save)
      execute_hooks_for(:before, :create)
      # noop
      execute_hooks_for(:after, :save)
      execute_hooks_for(:after, :create)
    end

    # TODO: implement me
    def create
      execute_hooks_for(:before, :create)
      # noop
      execute_hooks_for(:after, :create)
    end

    # TODO: implement me
    def update(*args)
      execute_hooks_for(:before, :update)
      # noop
      execute_hooks_for(:after, :update)
    end

    # TODO: implement me
    def destroy
      execute_hooks_for(:before, :destroy)
      # noop
      execute_hooks_for(:after, :destroy)
    end

    # TODO: shared with Resource
    def execute_hooks_for(type, name)
      model.hooks[name][type].each { |hook| hook.call(self) }
    end
  end
end
