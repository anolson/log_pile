module LogPile
  class Logfile < ActiveRecord::Base
    def to_param
      permalink
    end
    
    def file_last_modified
      File.stat(path).mtime
    end
  end
end
