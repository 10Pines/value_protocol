require 'spec_helper'

describe 'Method backwards compatibility' do

  it 'should not override :call behavior in Method when arguments are not expected' do
    upcase_method = 'ruby'.method :upcase

    result = upcase_method.call

    result.should == 'RUBY'
  end

  it 'should not override :call behavior in Method when arguments are expected' do
    add_method = 1.method :+

    result = add_method.call 1

    result.should == 2
  end

  it 'should not override :to_proc behavior in Method' do
    upcase_method = 'ruby'.method :upcase
    to_upcase = upcase_method.to_proc

    result = to_upcase.call

    result.should == 'RUBY'
  end

end