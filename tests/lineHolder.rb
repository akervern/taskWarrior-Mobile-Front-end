require 'TaskHelper.rb'

describe "Holder" do
  before(:each) do
	@splitter = TaskSplitter.new
	@splitter.columns = [2, 3]
  end

  it "is storing correctly parsing info" do
    holder = @splitter.fillTaskHolder(" 3 arn")
	holder.line.should eq " 3 arn"
	holder.columns.size.should eq 2
	holder.isAnnotation.should be_false
  end
end
