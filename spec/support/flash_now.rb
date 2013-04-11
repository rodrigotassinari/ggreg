# encoding: utf-8

# permite testar o flash.now
RSpec.configure do |config|

  config.before(:each, :behaviour_type => :controller) do
    @controller.instance_eval { flash.stub!(:sweep) }
  end

end
