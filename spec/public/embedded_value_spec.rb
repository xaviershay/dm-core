require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

describe DataMapper::EmbeddedValue do
  class ::Address
    include DataMapper::EmbeddedValue

    def an_instance_method
    end
  end

  class ::SubAddress < Address; end

  DataMapper.finalize

  before :all do
    @base_model = ::Address
    @sub_model  = ::SubAddress

    @resource = @base_model.new
  end

  it_should_behave_like "a Model with properties"
  it_should_behave_like "a Model with hooks"
end
