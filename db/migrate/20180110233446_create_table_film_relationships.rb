class CreateTableFilmRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :film_relationships do |t|
      t.integer :from_film_id
      t.integer :to_film_id

      t.timestamps
    end
  end
end
