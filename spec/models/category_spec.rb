require 'spec_helper'


describe Category do

  it{should have_valid(:name).when("Funny", "Spring 2014 Cohort") }
  it{should_not have_valid(:name).when("", nil) }

end
