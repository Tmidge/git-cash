class AddTable < ActiveRecord::Migration
  def change
    create_table :repositories do |t|

      t.string :name
      t.text :body
      t.string :url
      t.string :language
      t.datetime :updated_at
      t.integer :number_of_forks
      t.integer :number_of_stars

      t.timestamps null: false
    end
  end
end
