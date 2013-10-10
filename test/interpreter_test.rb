require 'test_helper'
require 'interpreter'

class InterpreterTest < Test::Unit::TestCase

  def test_code
    code = <<-CODE
class Awesome:
  def does_it_work:
    "yeah!"

awesome_object = Awesome.new
if awesome_object:
  print(awesome_object.does_it_work)
CODE

    assert_prints("yeah!\n") { Interpreter.new.eval(code) }
  end

  def test_calling_other_method
    code = <<-CODE
class Awesome:
  def does_it_call_another_method:
    does_it_work()
  def does_it_work:
    "yeah!"

awesome_object = Awesome.new
if awesome_object:
  print(awesome_object.does_it_call_another_method)
CODE

    assert_prints("yeah!\n") { Interpreter.new.eval(code) }
  end
end
