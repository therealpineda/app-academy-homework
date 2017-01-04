require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :titleize => "Chef Will the Great Baker") }
  subject(:cheesecake) { Dessert.new("cake", 10, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cheesecake.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(cheesecake.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(cheesecake.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "0", "") }.to  raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cheesecake.ingredients).not_to include("berries")
      cheesecake.add_ingredient("berries")
      expect(cheesecake.ingredients).to include("berries")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      items = [1,2,3,4,5,6,7,8,9,10]
      items.each { |n| cheesecake.add_ingredient(n) }
      cheesecake.mix!
      expect(cheesecake.ingredients).not_to eq(items)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(cheesecake.quantity).to eq(10)
      cheesecake.eat(3)
      expect(cheesecake.quantity).to eq(7)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cheesecake.eat (11) }.to raise_error
    end

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(cheesecake.serve).to include("Chef Will the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cheesecake)
      cheesecake.make_more
    end
  end
end
