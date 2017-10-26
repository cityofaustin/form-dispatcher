class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.json :content
      t.string :destination

      t.timestamps
    end
  end
end
