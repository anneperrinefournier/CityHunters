class RenameContentToSolutionInRiddles < ActiveRecord::Migration[7.1]
  def change
    rename_column :riddles, :content, :solution
  end
end
