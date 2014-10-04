require 'option'

describe Option do
	
	it "should have a name" do
		expect(Option.new("rock").name).to eq(:rock)
	end
	
end