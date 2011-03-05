require 'TaskHelper.rb'

describe "Parsing" do
  describe "header" do
    it "is correct" do
	  TaskSplitter.new.splitHead("xx xx xxx xx").should eq [2, 2, 3, 2]
	end
	it "is not considering white spaces" do
	  TaskSplitter.new.splitHead(" xx  xx    xxx ").should_not eq [0, 2, 2, 3, 0]
	end
  end
  describe "Line" do
    before(:each) do
	  @splitter = TaskSplitter.new
	  @splitter.columns = [2, 3, 4, 5]
	end

    it "is correctly cleanning useless header footer" do
	  @splitter.each_line ["", "xx xxxx", "", "not useless", "not useless", "", "task 4"] do |line|
	    line.should eq "not useless"
	  end
	end

    it "is correctly cleanning useless header footer" do
	  @splitter.each_line ["xx", "xx", "xx", "not useless", "not useless", "xx", "xx"] do |line|
	    line.should_not eq "xx"
	  end
	end

    it "is correctly parsing columns" do
	  @count = 0
	  @splitter.each_column " 1   1    1     1" do |column|
	    @count += 1
	  end
	  @count.should eq 4
	end
  end
end
