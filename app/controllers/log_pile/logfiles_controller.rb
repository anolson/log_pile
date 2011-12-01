module LogPile
  class LogfilesController < ApplicationController
    def index
      @files = Logfile.all
    end
    
    def show
      @file = Logfile.find_by_permalink(params[:id])
      @key = LogStreamer.start_log_stream(@file.path)
    end
    
    def poll    
      messages = LogStreamer.log_messages(params[:key])
      render :text => messages.join("\n")
    end
    
    private    
      def find_file_by_key(key)
        {:key => key, :name => files[key]}
      end
      
      def files
        {'app' => Rails.application.config.paths["log"].first}
      end    
  end
end
