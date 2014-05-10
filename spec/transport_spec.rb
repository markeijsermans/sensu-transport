require File.join(File.dirname(__FILE__), "helpers")
require "sensu/transport"

describe "Sensu::Transport" do
  include Helpers

  it "can load and connect to the rabbitmq transport" do
    async_wrapper do
      transport = Sensu::Transport.load("rabbitmq")
      transport.connect
      timer(1) do
        transport.connected?.should be_true
        async_done
      end
    end
  end
end