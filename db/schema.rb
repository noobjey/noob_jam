ActiveRecord::Schema.define(version: 20150730030826) do

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
  end

end
