class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :subscriber_id
      t.integer :poster_id

      t.timestamps
  end
end
end
