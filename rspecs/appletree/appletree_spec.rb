require_relative "appletree"
    RSpec.describe AppleTree do
        before do
            @johnny = AppleTree.new
        end
        describe 'attributes' do
            it "should have a height and age" do
                expect(@johnny).to have_attributes(:height => 120)
                expect(@johnny).to have_attributes(:age => 9)
            end
        end
        describe 'behavior' do
            it "should have a count of apples" do
                expect(@johnny.count_apples).to eq(70)
            end
            it "should have a method called year_gone_by that ages the tree by 1 and affects the height" do
                expect(@johnny.year_gone_by).to eq("125 ft, 10 yrs, 80 apples")
            end
            it "should have a method called pick_apples that takes all of the apples off the tree" do
                expect(@johnny.pick_apples).to eq(0)
            end
            it "should decay and not grow after 10 years" do
                @tree = AppleTree.new
                @tree.age = 11
                @tree.height = 100
                expect(@tree.year_gone_by).to eq("95 ft, 12 yrs, 70 apples")
            end
            it "should not grow apples for the first three years of it's life" do
                @tree2 = AppleTree.new
                @tree2.age = 1
                @tree2.apples = 1
                expect(@tree2.year_gone_by).to eq("125 ft, 2 yrs, 1 apples")
            end
        end
    end
