class ArgsParser
  attr_accessor :args

  def initialize(args)
    @args = args
  end

  def retrieve_arg(arg_name)
    index = args.index(arg_name) || abort("Error: #{arg_name} argument is required")
    args[index + 1] || abort("Error: no value passed for argument #{arg_name}")
  end
end