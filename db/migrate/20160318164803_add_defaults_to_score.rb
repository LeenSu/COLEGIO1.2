class AddDefaultsToScore < ActiveRecord::Migration
  def change
    change_column_default :scores, :score_one, 0
    change_column_default :scores, :score_two, 0
    change_column_default :scores, :score_three, 0
    change_column_default :scores, :score_four, 0
    change_column_default :scores, :score_test, 0
    change_column_default :scores, :score_final, 0
  end
end
