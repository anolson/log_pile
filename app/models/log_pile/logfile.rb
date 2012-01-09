module LogPile
  class Logfile < ActiveRecord::Base
    validates_presence_of :name, :path

    after_create :generate_permalink

    def to_param
      permalink
    end

    def file_last_modified
      File.stat(path).mtime
    end

    def generate_permalink
      self.permalink = name.gsub(/\s/, '_').downcase
      save
    end
  end
end
