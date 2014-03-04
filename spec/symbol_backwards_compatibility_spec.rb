require 'spec_helper'

describe 'Symbol backwards compatibility' do

  it 'should not override :to_proc behavior in Symbol' do
    to_upcase = :upcase.to_proc

    result = to_upcase.call 'ruby'

    result.should == 'RUBY'
  end

end