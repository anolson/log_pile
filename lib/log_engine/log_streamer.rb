class LogStreamer

  def self.start_log_stream(filename, file_key)
    start_sweeper
    start_producer(filename, file_key, LogStream.new)
  end
  
  def self.log_messages(file_key, key)
    producers[file_key].streams[key].log_messages
  end
    
  def self.producers
    @@producers ||= Hash.new
  end
  
  def self.start_producer(filename, file_key, stream)
    if(producers.has_key?(file_key))
       producers[file_key].add_stream(stream) 
    else
      puts "Starting new log producer for #{filename}."
      producers[file_key] = LogProducer.new(:filename => filename, :stream => stream)
      producers[file_key].start
    end
    stream.key
  end
  
  def self.start_sweeper  
    @@sweeper ||= Thread.new do
      while(1) do
        producers.each do |k, p|
          if(p.should_stop?)
            puts "Stopping producer thread."
            p.stop 
            producers.delete(k)
          end
        end
        sleep(5)
      end
    end
  end
end