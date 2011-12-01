# encoding: UTF-8

require 'spec_helper'

describe Snowday do
  let(:output)    { StringIO.new }
  let(:formatter) { Snowday.new(output) }

  before do
    formatter.stub(:delay => true)
  end

  describe "Snowday output" do
    let(:example) {
      double("example 1",
       :execution_result => {:status => 'failed', :exception => Exception.new }
      )
    }

    it "displays 'It's snowing outside' at the start of the suite" do
      formatter.start(1)
      output.string.should =~ /It's snowing outside/
    end

    it "displays a pretty snowfall at the start of the suite" do
      formatter.start(1)
      output.string.should =~ /\*/
    end

    it "displays '☃' when examples pass" do
      formatter.example_passed(example)
      output.string.should =~ /☃/
    end

    it "displays '☃' when examples fail" do
      formatter.example_failed(example)
      output.string.should =~ /☃/
    end

    it "displays '☃' when examples are pending" do
      formatter.example_pending(example)
      output.string.should =~ /☃/
    end

    it "displays '☃ Brrrr. It's nice and cold for these snowmen. Feels like winter out here.' all examples pass" do
      formatter.example_passed(example)
      formatter.stop
      output.string.should =~ /winter/
    end

    it "displays '☹ Oh noes! A few snowmen are melted. Feels like fall out here.' when 1-5 examples fail" do
      formatter.example_passed(example)
      (rand(5) + 1).times do
        formatter.example_failed(example)
      end
      formatter.stop
      output.string.should =~ /fall/
    end

    it "displays '☹ Oh noes! Some of your snowmen are getting watery. Feels like spring out here.' when 6-10 examples fail" do
      formatter.example_passed(example)
      (rand(5) + 6).times do
        formatter.example_failed(example)
      end
      formatter.stop
      output.string.should =~ /spring/
    end

    it "displays '☹ Oh noes! Your snowmen are melted. Feels like summer out here.' when more than 10 examples fail" do
      formatter.example_passed(example)
      11.times do
        formatter.example_failed(example)
      end
      formatter.stop
      output.string.should =~ /summer/
    end
  end
end
