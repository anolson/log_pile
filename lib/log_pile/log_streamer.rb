class LogStreamer
  def self.start_log_stream(filename)
    start_sweeper
    add_stream(filename).key
  end

  def self.log_messages(key)
    return [] if streams[key].nil?
    
    streams[key].log_messages
  end

  def self.streams
    @@streams ||= Hash.new
  end

  def self.add_stream(filename)
    stream = LogStream.new(filename)
    streams[stream.key] = stream
    stream.start
    stream
  end

  def self.remove_stream(key)
    streams[key].stop
    streams.delete(key)
  end

  def self.start_sweeper
    @@sweeper ||= Thread.new do
      while(1) do
        streams.each do |k, s|
          if(s.idle?)
            puts "Stopping thread."
            remove_stream(k)
          end
        end
        sleep(60)
      end
    end
  end
end