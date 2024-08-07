class CreateAppErrors < ActiveRecord::Migration[7.1]
  def change
    create_table "app_errors", force: :cascade do |t|
      t.string "ae_error"
      t.text "ae_backtrace"
      t.string "ae_severity"
      t.string "ae_handled"
      t.string "ae_source"
      t.string "ae_context"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
