require 'spec_helper'

describe 'Proc backwards compatibility' do

  it 'should not override :call behavior in procs' do
    proc = Proc.new { 7 }

    result = proc.call

    result.should == 7
  end

  it 'should not override :call behavior in lambdas' do
    lambda = lambda { 7 }

    result = lambda.call

    result.should == 7
  end

  it 'should not override :to_proc behavior in procs' do
    proc = Proc.new {}

    result = proc.to_proc

    result.should == proc
  end

  it 'should not override :to_proc behavior in lambdas' do
    lambda = lambda {}

    result = lambda.to_proc

    result.should == lambda
  end

end