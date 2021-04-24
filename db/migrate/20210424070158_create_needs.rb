class CreateNeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :needs do |t|
      t.references :foreigner, foreign_key: true
      t.string     :title, null: false
      t.string     :detail, null: false
      t.string     :remarks
      t.timestamps
    end
  end
end
