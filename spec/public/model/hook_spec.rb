require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'spec_helper'))

describe DataMapper::Model::Hook do
  before :all do
    class ::ModelHookSpecs
      include DataMapper::Resource

      property :id, Serial

      def an_instance_method
      end
    end

    class ::ModelHookSpecsSubclass < ModelHookSpecs; end

    DataMapper.finalize
  end

  before :all do
    @base_model = ::ModelHookSpecs
    @sub_model  = ::ModelHookSpecsSubclass
    @resource   = ModelHookSpecs.new
  end

  it_should_behave_like "a Model with hooks"
end
