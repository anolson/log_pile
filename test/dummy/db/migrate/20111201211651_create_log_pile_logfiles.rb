class CreateLogPileLogfiles < ActiveRecord::Migration
  def change
    create_table :log_pile_logfiles do |t|
      t.string :name
      t.string :path
      t.string :permalink

      t.timestamps
    end
  end
end
