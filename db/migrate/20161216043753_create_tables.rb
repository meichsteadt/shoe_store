class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table(:shoes) do |s|
      s.column(:name, :string)

      s.timestamps
    end
    create_table(:stores) do |s|
      s.column(:name, :string)

      s.timestamps
    end
    create_table(:shoes_stores) do |s|
      s.column(:shoe_id, :integer)
      s.column(:store_id, :integer)

      s.timestamps
    end
  end
end
