# encoding: utf-8

# Enables testing flash.now
RSpec.configure do |config|
  config.before(:each, :behaviour_type => :controller) do
    @controller.instance_eval { flash.stub!(:sweep) }
  end
end
