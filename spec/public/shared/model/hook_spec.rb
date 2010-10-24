share_examples_for "a Model with hooks" do
  describe DataMapper::Model::Hook do
    supported_by :all do
      let(:base_model) { @base_model }
      let(:sub_model)  { @sub_model }

      describe '#before' do
        describe 'an instance method' do
          before do
            @hooks = hooks = []
            base_model.before(:an_instance_method) { hooks << :before_instance_method }

            @resource.an_instance_method
          end

          it 'should execute before instance method hook' do
            @hooks.should == [ :before_instance_method ]
          end
        end

        describe 'save' do
          before do
            @hooks = hooks = []
            base_model.before(:save) { hooks << :before_save }

            @resource.save
          end

          it 'should execute before save hook' do
            @hooks.should == [ :before_save ]
          end
        end

        describe 'create' do
          before do
            @hooks = hooks = []
            base_model.before(:create) { hooks << :before_create }

            @resource.save
          end

          it 'should execute before create hook' do
            @hooks.should == [ :before_create ]
          end
        end

        describe 'update' do
          before do
            @hooks = hooks = []
            base_model.before(:update) { hooks << :before_update }

            @resource.save
            @resource.update(:id => 2)
          end

          it 'should execute before update hook' do
            @hooks.should == [ :before_update ]
          end
        end

        describe 'destroy' do
          before do
            @hooks = hooks = []
            base_model.before(:destroy) { hooks << :before_destroy }

            @resource.save
            @resource.destroy
          end

          it 'should execute before destroy hook' do
            @hooks.should == [ :before_destroy ]
          end
        end

        describe 'with an inherited hook' do
          before do
            @hooks = hooks = []
            base_model.before(:an_instance_method) { hooks << :inherited_hook }
          end

          it 'should execute inherited hook' do
            sub_model.new.an_instance_method
            @hooks.should == [ :inherited_hook ]
          end
        end

        describe 'with a hook declared in the subclasss' do
          before do
            @hooks = hooks = []
            sub_model.before(:an_instance_method) { hooks << :hook }
          end

          it 'should execute hook' do
            sub_model.new.an_instance_method
            @hooks.should == [ :hook ]
          end

          it 'should not alter hooks in the parent class' do
            @hooks.should be_empty
            base_model.new.an_instance_method
            @hooks.should == []
          end
        end
      end

      describe '#after' do
        describe 'an instance method' do
          before do
            @hooks = hooks = []
            base_model.after(:an_instance_method) { hooks << :after_instance_method }

            @resource.an_instance_method
          end

          it 'should execute after instance method hook' do
            @hooks.should == [ :after_instance_method ]
          end
        end

        describe 'save' do
          before do
            @hooks = hooks = []
            base_model.after(:save) { hooks << :after_save }

            @resource.save
          end

          it 'should execute after save hook' do
            @hooks.should == [ :after_save ]
          end
        end

        describe 'create' do
          before do
            @hooks = hooks = []
            base_model.after(:create) { hooks << :after_create }

            @resource.save
          end

          it 'should execute after create hook' do
            @hooks.should == [ :after_create ]
          end
        end

        describe 'update' do
          before do
            @hooks = hooks = []
            base_model.after(:update) { hooks << :after_update }

            @resource.save
            @resource.update(:id => 2)
          end

          it 'should execute after update hook' do
            @hooks.should == [ :after_update ]
          end
        end

        describe 'destroy' do
          before do
            @hooks = hooks = []
            base_model.after(:destroy) { hooks << :after_destroy }

            @resource.save
            @resource.destroy
          end

          it 'should execute after destroy hook' do
            @hooks.should == [ :after_destroy ]
          end
        end

        describe 'with an inherited hook' do
          before do
            @hooks = hooks = []
            base_model.after(:an_instance_method) { hooks << :inherited_hook }
          end

          it 'should execute inherited hook' do
            sub_model.new.an_instance_method
            @hooks.should == [ :inherited_hook ]
          end
        end

        describe 'with a hook declared in the subclasss' do
          before do
            @hooks = hooks = []
            sub_model.after(:an_instance_method) { hooks << :hook }
          end

          it 'should execute hook' do
            sub_model.new.an_instance_method
            @hooks.should == [ :hook ]
          end

          it 'should not alter hooks in the parent class' do
            @hooks.should be_empty
            base_model.new.an_instance_method
            @hooks.should == []
          end
        end

      end
    end
  end
end
