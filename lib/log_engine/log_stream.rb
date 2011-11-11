require 'digest'

class LogStream
  IDLE_THRESHOLD = 60
  
  attr_accessor :queue, :key, :filename
  
  def initialize()
    @queue = Queue.new
    @key = generate_hash
    @last_read_at = seconds
  end
  
  def log_messages()
    @last_read_at = seconds
    collect_messages
  end
  
  def collect_messages()
    messages = []
    pop_messages { |message| messages << message }
    messages
  end
  
  def pop_messages(&block)
    @queue.size.times do 
      yield queue.pop
    end
  end

  def idle?()
    idle_time > IDLE_THRESHOLD
  end
  
  def idle_time()
    seconds - @last_read_at
  end
  
  def generate_hash()
    h = Digest::SHA2.new << seconds.to_s
    h.to_s
  end
  
  def seconds
    Time.now.to_i
  end
end