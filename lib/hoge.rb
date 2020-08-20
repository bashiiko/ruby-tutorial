name = "alice"

a=<<~"TEXT"
  this is a long text
  test
  test
  #{name}
TEXT

puts a
