# Ruby syntax reminder

## Conditionals

    if condition
      do_things()
    end

    do_things if condition


## Iterating

    values = ['a', 'b', 'c']

    values.each do |item|
      puts item
    end

## Hashes

    my_hash = {}

    my_hash = {"key" => "value", 
              "key2" => "value2"}

    my_hash = {key: 'value', key2: 'key2'}

## RSpec

### A simple test

    describe "Truth" do
      it "must be truthy" do
        expect(true).to be_true
      end

      it "must make one equal one" do
        expect(1).to eq(1)
      end
    end

### Matchers

    eq(something)

    be_nil
    be_empty

    include(element)
    
### Bundler

Install all dependencies

    bundle install

### Guard

Interactive mode (problems with virtual box)

    guard -i

Pooling mode

    guard -p -l 4