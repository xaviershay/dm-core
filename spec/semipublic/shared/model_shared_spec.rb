share_examples_for 'A semipublic Model' do
  before :all do
    %w[ @model @include ].each do |ivar|
      raise "+#{ivar}+ should be defined in before block" unless instance_variable_get(ivar)
    end
  end

  it { should respond_to(:append_inclusions) }

  describe '.append_inclusions' do
    module ::Inclusions
      def new_method
      end
    end

    describe 'before the model is defined' do
      before :all do
        @model.append_inclusions(Inclusions)

        class ::User; end
        User.send :include, @include
        User.property(:id, DataMapper::Property::Serial)
      end

      it 'should respond to :new_method' do
        User.new.should respond_to(:new_method)
      end

      after :all do
        @model.extra_inclusions.delete(Inclusions)
      end
    end

    describe 'after the model is defined' do
      before :all do
        class ::User; end
        User.send :include, @include
        User.property(:id, DataMapper::Property::Serial)
        
        @model.append_inclusions(Inclusions)
      end

      it 'should respond to :new_method' do
        User.new.should respond_to(:new_method)
      end

      after :all do
        @model.extra_inclusions.delete(Inclusions)
      end
    end
  end

  it { should respond_to(:append_extensions) }

  describe '.append_extensions' do
    module ::Extensions
      def new_method
      end
    end

    describe 'before the model is defined' do
      before :all do
        @model.append_extensions(Extensions)

        class ::User; end
        User.send :include, @include
        User.property(:id, DataMapper::Property::Serial)
      end

      it 'should respond to :new_method' do
        User.should respond_to(:new_method)
      end

      after :all do
        @model.extra_extensions.delete(Extensions)
      end
    end

    describe 'after the model is defined' do
      before :all do
        class ::User; end
        User.send :include, @include
        User.property(:id, DataMapper::Property::Serial)
        
        @model.append_extensions(Extensions)
      end

      it 'should respond to :new_method' do
        User.should respond_to(:new_method)
      end

      after :all do
        @model.extra_extensions.delete(Extensions)
      end
    end
  end
end
