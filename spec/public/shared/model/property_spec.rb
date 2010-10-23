share_examples_for "a Model with properties" do
  describe DataMapper::Model::Property do
    before :all do
      %w[ @model ].each do |ivar|
        raise "+#{ivar}+ should be defined in before block" unless instance_variable_defined?(ivar)
        raise "+#{ivar}+ should not be nil in before block" unless instance_variable_get(ivar)
      end
    end

    before :each do
      @local_model = @model.dup
      DataMapper.finalize
    end

    it "should respond to #property" do
      @local_model.should respond_to(:property)
    end

    describe '#property' do

      subject { @local_model.property(:name, String) }

      it 'should define a name accessor' do
        @local_model.should_not be_method_defined(:name)
        subject
        @local_model.should be_method_defined(:name)
      end

      it 'should define a name= mutator' do
        @local_model.should_not be_method_defined(:name=)
        subject
        @local_model.should be_method_defined(:name=)
      end

      it 'should raise an exception if the method exists' do
        lambda {
          @local_model.property(:key, String)
        }.should raise_error(ArgumentError, '+name+ was :key, which cannot be used as a property name since it collides with an existing method')
      end
    end
  end
end
