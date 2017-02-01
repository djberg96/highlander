module Highlander
  # The version of the highlander library
  VERSION = '0.2.1'
end

BEGIN{
  unless $PROGRAM_NAME == 'irb' || $PROGRAM_NAME == 'jirb'
    program = File.expand_path($PROGRAM_NAME)
    DATA = File.open(program) unless defined?(DATA)
    status = DATA.flock(File::LOCK_EX | File::LOCK_NB)

    if status != 0
      raise RuntimeError, "There can be only one! Program '#{program}' already running"
      exit! # In case of rescue, forcibly bail
    end
  end
}

include Highlander
