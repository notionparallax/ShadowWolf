require 'spec_helper'

describe PersonName do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :preferred_first_name }
  it { should validate_presence_of :preferred_last_name }
end
