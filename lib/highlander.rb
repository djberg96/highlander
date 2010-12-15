module Highlander
  # The version of the highlander library
  VERSION = '0.1.1'
  
  BEGIN{
    unless $0 == 'irb'
      program = File.expand_path($0)
      unless defined?(DATA)
        DATA = File.open(program)
        at_exit { highlander_at_exit }
      end
      status = DATA.flock(File::LOCK_EX | File::LOCK_NB)

      if status != 0
        raise RuntimeError, "Program '#{program}' already running"
        exit 1 # In case of error, bail out
      end
    end
  }

  # you can override this function at the toplevel or Highlander#highlander_at_exit
  def highlander_at_exit
    DATA.close if Object.const_defined?(:DATA) && DATA.respond_to?(:close)
  end
end

include Highlander
