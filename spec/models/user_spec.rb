require 'spec_helper'

describe User do
  it { should have_valid(:email).when("mskylehutchinson@gmail.com", "judy@hotmail.com", "furgie413@yahoo.com") }
  it { should_not have_valid(:email).when("mskyle@com", "tweet", "", nil, "bruce@gmail", "frenchie.com") }

  it { should have_many(:blogs) }
  it { should have_many(:blog_entries) }
  it { should have_many(:categories) }
end
