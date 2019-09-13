class Tweet < ActiveRecord::Migration[5.2]
  def change
    drop_table :tweets
  end
end
