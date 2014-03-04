require 'spec_helper'

describe 'Method backwards compatibility' do

  it 'should not override :call behavior in Method' do
    upcase_method = 'ruby'.method :upcase

    result = upcase_method.call

    result.should == 'RUBY'
  end

  it 'should not override :to_proc behavior in Method' do
    upcase_method = 'ruby'.method :upcase
    to_upcase = upcase_method.to_proc

    result = to_upcase.call

    result.should == 'RUBY'
  end

end