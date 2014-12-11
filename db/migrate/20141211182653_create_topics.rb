class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
    	t.string :subject
    	t.references :forum
    	t.timestamps
    end
  end
end
