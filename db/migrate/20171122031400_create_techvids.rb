class CreateTechvids < ActiveRecord::Migration[5.1]
  def change
    create_table :techvids do |t|
      t.string :name
      t.string :channel_address

      t.timestamps
    end
  end
end
