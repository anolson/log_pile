require 'singleton'

class LogStreamer
  include Singleton

  def start_log_stream(filename)
    start_sweeper
    add_stream(filename).key
  end

  def log_messages(key)
    return [] if streams[key].nil?
    streams[key].log_messages
  end

  private
    def streams
      @streams ||= Hash.new
    end

    def add_stream(filename)
      stream = LogStream.new(filename)
      streams[stream.key] = stream
      stream.start
      stream
    end

    def remove_stream(key)
      streams[key].stop
      streams.delete(key)
    end

    def start_sweeper
      @sweeper ||= start_sweeper_thread
    end

    def start_sweeper_thread
      Thread.new do
        while(1) do
          remove_idle_streams
          sleep(60)
        end
      end
    end

    def remove_idle_streams
      streams.each do |k, s|
        remove_stream(k) if(s.idle?)
      end
    end
end