require File.expand_path(File.join(File.dirname(__FILE__), '../..', 'spec_helper'))

describe DataMapper::EmbeddedValue::Model do
  before :all do
    @model   = DataMapper::EmbeddedValue::Model
    @include = DataMapper::EmbeddedValue
  end

  it_should_behave_like "A semipublic Model"
end
