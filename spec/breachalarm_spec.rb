require 'helper'

describe BreachAlarm do
  before do
    BreachAlarm.reset!
  end

  after do
    BreachAlarm.reset!
  end

  it "sets defaults" do
    BreachAlarm::Configurable.keys.each do |key|
      expect(BreachAlarm.instance_variable_get(:"@#{key}")).to eq(BreachAlarm::Default.send(key))
    end
  end

end
