require "observer"
class Foo

 include Observable

 def foo
  loop do
    i = rand(5..15)
    changed
    puts "Before Observing Foo"
    notify_observers(i)
    puts "After Observing Foo"
    sleep 1
  end
 end
end

class ObserveFoo

  def initialize(obj)
    obj.add_observer(self)
  end

  def update(n)
    puts "AZAZA #{n}" if n <= 10
  end
end

class ObserveFoo2
  def initialize(obj)
    obj.add_observer(self)
  end

  def update(n)
    puts 'DEECH ' + "#{n}" if n > 10
  end
end

v = Foo.new
ObserveFoo.new(v)
ObserveFoo2.new(v)
v.foo
