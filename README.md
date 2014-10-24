# ValueProtocol

Allows passing any object where a block is expected.  
It is inspired by the way Smalltalk deals with the same scenario, making use of the ```#value``` message.

## Motivation

I wrote this gem to avoid having to wrap objects inside lambdas (and thus, avoid repeating code) when working with messages like ```:detect```.

I wanted to turn this:

```ruby
numbers.detect(lambda{ 2 }) { |number| number.even? }
```

Into something like this, reducing the noise introduced by the ```lambda``` part:

```ruby
numbers.detect(2) { |number| number.even? }
```

Also, I wanted to be able to pass any object when an implicit block is expected:

```ruby
# create an instance of a complex condition
even_numbers = EvenNumberCondition.new
numbers.select &even_numbers
```

## How does it work?

Value Protocol implements `:call` (returning `self`), and implements `:to_proc` (returning a proc that evaluates `self.call`) in `Object`.

It sound more complicated than it really is. Take a look at the [implementation](lib/value_protocol/protocol.rb) and [specs](spec/value_protocol_spec.rb)!

## Usage

Just pass any object where a block is expected (respecting the & operator when needed). That's all.  
If you want to implement custom behavior, override the ```:call``` method in your class (remember to respect the signature!).

For most scenarios, you won't need to override ```:to_proc```.

## Feel like reading a blog post?

Check this out! [Rock Your Ruby: The Value of Value](http://www.10pines.com/blog/posts/rock-your-ruby-the-value-of-value)

## Installation

Add this line to your application's Gemfile:

    gem 'value_protocol'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install value_protocol

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
