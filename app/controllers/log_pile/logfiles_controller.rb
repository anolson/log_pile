module LogPile
  class LogfilesController < ApplicationController
    def index
      @files = files
    end
    
    def show
      @file = find_file_by_key(params[:permalink])
      @key = LogStreamer.start_log_stream(@file[:name])
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
