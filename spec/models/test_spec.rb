require 'rails_helper'
  RSpec.describe "test" do
   before(:each) do
   	puts "executed before"
   	@event = Event.create
   end

   it "+" do
   	puts "1"
   	expect(1+1).to eq(2)
   end 
   it "*" do
   	puts "2"
   	expect(1*1).to eq(1)
   end
   it "/" do
   	puts "3"
   	expect(1/1).to eq(1)
   end
   it "-" do
   	puts "4"
   	expect(1-1).to eq(0)
   end 

   it "change" do
   	expect {
   	  Event.create
   	}.to change{Event.count}.by(1)
   end

 $count = 0
 describe "let" do
   let(:count) { $count += 1 }

    it "memoizes the value" do
      count.should == 1
      count.should == 1
    end

    it "is not cached across examples" do
      count.should == 2
    end
  end
end