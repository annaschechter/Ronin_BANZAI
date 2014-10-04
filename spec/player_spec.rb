require 'player'

describe Player do 

	let(:player){Player.new}
	let(:option){double :option, :class => Option}

	it "should have a name" do
		player.name = "Anna"
		expect(player.name).to eq("Anna")
	end

	it "should initialize with no option" do
		expect(player.option).to eq(nil)
	end

	it "can pick option" do
		player.pick(option)
		expect(player.option.class).to eq(Option)
	end

	it "knows if it has played" do
		player.pick(option)
		expect(player).to have_played
	end
	
end