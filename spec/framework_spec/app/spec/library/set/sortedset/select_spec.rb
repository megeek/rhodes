require File.expand_path('../../../../spec_helper', __FILE__)
require 'set'
=begin
ruby_version_is "1.9" do
  describe "SortedSet#select!" do
    before(:each) do
      @set = SortedSet["one", "two", "three"]
    end

    it "yields each Object in self in sorted order" do
      res = []
      @set.select! { |x| res << x }
      res.should == ["one", "two", "three"].sort
    end

    it "keeps every element from self for which the passed block returns true" do
      @set.select! { |x| x.size != 3 }
      @set.to_a.should == ["three"]
    end

    it "returns self when self was modified" do
      @set.select! { false }.should equal(@set)
    end

    it "returns nil when self was not modified" do
      @set.select! { true }.should be_nil
    end

    it "returns an Enumerator when passed no block" do
      enum = @set.select!
      enum.should be_an_instance_of(enumerator_class)

      enum.each { |x| x.size != 3 }
      @set.to_a.should == ["three"]
    end
  end
end
=end