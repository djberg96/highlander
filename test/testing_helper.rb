module TestingHelper
  FLAG_FILE = '/tmp/highlander_at_exit.txt'
  LIB = File.expand_path('../../lib', __FILE__)
  RUNNER = File.expand_path('../locking_runner.rb', __FILE__)
  
  def delete_flag_file
    begin
      File.delete(FLAG_FILE)
    rescue Errno::ENOENT
      #noop
    end
  end

  def call_locking_runner
    `ruby -I #{LIB} #{RUNNER}`
  end
end
