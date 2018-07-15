class AddImageUrlToListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :image_url, :string
  end
end
