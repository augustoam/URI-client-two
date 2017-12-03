class Timers < ActiveRecord::Migration[5.1]
  def change
    create_table :timers do |t|
      t.datetime :time
    end
  end
end
