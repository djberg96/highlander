module Highlander
  VERSION = '0.1.0'
  BEGIN{
    program = File.expand_path($0)
    DATA = File.open(program) unless defined?(DATA)
    status = DATA.flock(File::LOCK_EX | File::LOCK_NB)

    if status != 0
      raise RuntimeError, "Program '#{program}' already running"
      exit! # In case of rescue, forcibly bail
    end
  }
end

include Highlander
