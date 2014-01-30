
require 'rubyqc/test'

describe 'kind_of' do
  [Fixnum, Bignum, Array].each do |klass|
    should klass.name do
      check(klass){ |obj| obj.should.kind_of(klass) }
    end
  end

  [[], [Fixnum], [Fixnum, Array],
   {}, {:a => 0}, {'b' => 1}, {2 => Fixnum},
   {nil => [Fixnum]}, {true => {false => [Fixnum]}}
  ].each do |spec|

    should spec.inspect do
      check(spec) do |generated|
        verify_generated(generated, spec)
      end
    end
  end
end
