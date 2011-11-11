require 'file/tail'
class LogProducer
  
  attr_accessor :streams
  
  def initialize(options = {})
    @streams = Hash.new
    @filename = options[:filename]
    add_stream(options[:stream])
  end
  
  def add_stream(stream)
    @streams[stream.key] = stream
  end
  
  def start
    @thread = Thread.new do
      begin
        
        File::Tail::Logfile.tail(@filename, :backward => 50) do |line|
          @streams.each do |key, stream|
            stream.queue << line.strip
          end          
        end        
      rescue
        puts $!
      end
    end
  end
  
  def stop
    @thread.kill
  end
  
  def should_stop?
    delete_idle_streams
    @streams.empty?
  end
  
  private  
    def delete_idle_streams
      @streams.each do |key, stream|
        if(stream.idle?)
          @streams.delete(key)
        end
      end
    end
end