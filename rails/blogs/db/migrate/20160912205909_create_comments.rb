class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :message, polymorphic: true, index: true
      t.references :post, polymorphic: true, index: true
      t.references :blog, polymorphic: true, index: true
      t.references :user, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
