require_relative 'wizard'
RSpec.describe Wizard do
    before do
        @wiz = Wizard.new
    end
    it "Wizard has default health of 50 and intelligence of 25" do
        expect(@wiz.health).to eq(50)
        expect(@wiz.intelligence).to eq(25)
    end
    it "Wizard has heal method that increases health by 10" do
        @wiz.health = 50
        expect(@wiz.heal).to eql(60)
    end
    it "Wizard has ancestor chain that includeds Human" do
        expect(Wizard.ancestors).to include(Human)
    end
    it "Wizard has fireball method that attacks an object and reduces the objects health" do
        Herb= Human.new
        Herb.health = 100
        expect(@wiz.fireball(Herb)).to eql(80)
    end

end
