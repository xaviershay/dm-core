require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

describe DataMapper::EmbeddedValue do
  before :all do
    class ::Address
      include DataMapper::EmbeddedValue
    end

    @model = Address
  end

  it_should_behave_like "a Model with properties"
end
