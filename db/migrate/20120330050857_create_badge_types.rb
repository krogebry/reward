class CreateBadgeTypes < ActiveRecord::Migration
  def change
    create_table :badge_types do |t|

      t.timestamps
    end
  end
end
