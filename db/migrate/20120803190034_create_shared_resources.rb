class CreateSharedResources < ActiveRecord::Migration
  def change
    create_table :shared_resources do |t|
      t.string :title
      t.references :user
      t.has_attached_file :file

      t.timestamps
    end
    add_index :shared_resources, :user_id
  end
end
