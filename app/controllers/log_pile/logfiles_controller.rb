module LogPile
  class LogfilesController < ApplicationController  
    def index
      @files = Logfile.all
    end
    
    def new
      @file = Logfile.new
    end

    def create
      @file = Logfile.new(params[:logfile])
      if(@file.save)
        redirect_to logfiles_path, :notice => "File added."
      else
        render :new
      end
    end

    def show
      @file = Logfile.find_by_permalink(params[:id])
      @key = log_streamer.start_log_stream(@file.path)
    end
    
    def poll    
      messages = log_streamer.log_messages(params[:key])
      render :text => messages.join("\n")
    end
    
    private
      def log_streamer
        LogStreamer.instance
      end    
  end
end
