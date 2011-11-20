# encoding: UTF-8

require 'rspec/core/formatters/base_text_formatter'

class Snowday < RSpec::Core::Formatters::BaseTextFormatter
  def start(example_count)
    super(example_count)
    output.print cyan <<-snowytimes
It's snowing outside...

*    *       *        *              *
  *   *            *      *     *
*        *      *       *          *
           ☃
‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

                      snowytimes
  end

  def stop
    case @failed_examples.length
    when 0
      output.print green("\n\n☃ Brrrr. It's nice and cold for these snowmens. Feels like winter out here.")
    when 1..5
      output.print red("\n\n☹ Oh noes! A few snowmens are melted. Feels like fall out here.")
    when 6..10
      output.print red("\n\n☹ Oh noes! Some of your snowmens are getting watery. Feels like spring out here.")
    else
      output.print red("\n\n☹ Oh noes! Your snowmens are melted. Feels like summer out here.")
    end
  end

  def example_passed(example)
    super(example)
    output.print green("☃ ")
  end

  def example_pending(example)
    super(example)
    output.print yellow('☃ ')
  end

  def example_failed(example)
    super(example)
    output.print red('☃ ')
  end
end

