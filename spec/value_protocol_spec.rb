require 'spec_helper'

describe ValueProtocol::Protocol do

  let(:apple) { Object.new }
  let(:orange) { Object.new }
  let(:fruits) { [apple, orange] }

  it 'should be possible to pass any object when an explicit block without arguments is expected' do
    fruit = fruits.detect(apple) { |_| false }

    fruit.should == apple
  end

  it 'should be possible to pass any object when an implicit block with arguments is expected' do
    apples_only = FruitFilter.new apple

    selected_fruits = fruits.select &apples_only

    selected_fruits.should have(1).item
    selected_fruits.should include apple
  end

  def evaluate_implicit_block_without_arguments &a_block
    a_block.call
  end

  it 'should be possible to pass any object when an implicit block without arguments is expected' do
    result = self.evaluate_implicit_block_without_arguments &apple

    result.should == apple
  end

  def evaluate_explicit_block_with_arguments a_block
    a_block.call :foo
  end

  it 'should be possible to pass any object when an explicit block with arguments is expected' do
    result = self.evaluate_explicit_block_with_arguments apple

    result.should == apple
  end

end