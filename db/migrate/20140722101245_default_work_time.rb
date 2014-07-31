class DefaultWorkTime < ActiveRecord::Migration
  def change
      create_table :default_work_times do |t|
      t.datetime :week, array: true, length: 5
    end
  end
end
