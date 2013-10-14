require 'spec_helper'

describe Category do
  it { should have_valid(:name).when("Fall2013", "awesomest blogs") }
  it { should_not have_valid(:name).when("", nil) }

  it { should have_valid(:user).when(User.new) }
  it { should_not have_valid(:user).when(nil) }

  it { should have_many(:blogs) }
  it { should belong_to(:user) }
end
