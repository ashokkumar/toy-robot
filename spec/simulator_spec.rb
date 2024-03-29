require 'spec_helper'

describe Simulator do
  let(:table_top) { TableTop.new(5, 5) }
  let(:robot) { Robot.new }
  let(:simulator) { Simulator.new(table_top, robot) }

  describe 'initialize' do
    it "should initialize with given table_top and robot" do
      expect(simulator.instance_variable_get("@table_top")).to eq(table_top)
      expect(simulator.instance_variable_get("@robot")).to eq(robot)
    end
  end

  describe 'execute cmd' do
    it "should execute the given place cmd with given arguments on the robot" do
      mock_location = "mock location"
      expect(robot).to receive(:place).and_return(mock_location)
      expect(simulator.execute("PLACE 0,0,NORTH")).to eq(mock_location)
    end

    ["LEFT", "RIGHT", "MOVE"].each do |cmd|
      it "should execute the given #{cmd} command on the robot" do
        output = "mock output"
        expect(robot).to receive(cmd.downcase.to_sym).and_return(output)
        expect(simulator.execute(cmd)).to eq(output)
      end
    end

    it "should return true if the result of the executed cmd from robot is not truthy" do
      expect(robot).to receive(:move).and_return(nil)
      expect(simulator.execute("MOVE")).to be_truthy
    end
  end

  describe 'invalid command' do
    it "should return false if given cmd is invalid" do
      output = simulator.execute("invalid_cmd")
      expect(output).to be_falsy
    end

    it "should return false if no arguments given for PLACE cmd" do
      output = simulator.execute("PLACE")
      expect(output).to be_falsy
    end

    it "should return false if invalid coordinates given for PLACE cmd" do
      output = simulator.execute("PLACE a,b,NORTH")
      expect(output).to be_falsy
    end

    it "should return false if invalid direction given for PLACE cmd" do
      output = simulator.execute("PLACE 0,0,SOUTHEAST")
      expect(output).to be_falsy
    end
  end
end