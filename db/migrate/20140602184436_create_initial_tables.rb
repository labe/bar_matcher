class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.belongs_to  :company
      t.string      :name
      t.integer     :weight_in_grams
      t.float       :length_in_cm
      t.float       :width_in_cm
      t.float       :calories
      t.float       :grams_carbs
      t.float       :grams_protein
      t.float       :grams_sugar
      t.float       :grams_fat

      t.timestamps
    end

    add_index :bars, :company_id
    add_index :bars, :grams_carbs
    add_index :bars, :grams_protein


    create_table :companies do |t|
      t.string  :name
      t.string  :website

      t.references
    end

    create_table :ingredients do |t|
      t.name
    end

    create_table :diets do |t|
      t.name
    end

    create_table :bar_ingredients do |t|
      t.belongs_to  :bar
      t.belongs_to  :ingredient

      t.references
    end

    add_index :bar_ingredients, :ingredient_id

    create_table :diet_bars do |t|
      t.belongs_to  :diet
      t.belongs_to  :bar

      t.references
    end

    add_index :diet_bars, :diet_id
  end
end
