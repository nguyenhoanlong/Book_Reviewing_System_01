# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_13_043232) do

  create_table "books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.string "author"
    t.integer "number_of_pages"
    t.float "price"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_books_on_category_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "rating_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rating_id"], name: "index_comments_on_rating_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "activity"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_histories_on_user_id"
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "history_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["history_id"], name: "index_likes_on_history_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "ratings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "poin"
    t.text "content"
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_ratings_on_book_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "relationships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.boolean "status"
    t.bigint "user_id"
    t.bigint "rating_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rating_id"], name: "index_requests_on_rating_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "user_books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "read", default: false
    t.boolean "favorite", default: false
    t.boolean "reading", default: false
    t.boolean "request", default: false
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_user_books_on_book_id"
    t.index ["user_id"], name: "index_user_books_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.text "activation_digest"
    t.text "password_digest"
    t.string "avatar"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "activated", default: false
  end

  add_foreign_key "books", "categories"
  add_foreign_key "comments", "ratings"
  add_foreign_key "comments", "users"
  add_foreign_key "histories", "users"
  add_foreign_key "likes", "histories"
  add_foreign_key "likes", "users"
  add_foreign_key "ratings", "books"
  add_foreign_key "ratings", "users"
  add_foreign_key "requests", "ratings"
  add_foreign_key "requests", "users"
  add_foreign_key "user_books", "books"
  add_foreign_key "user_books", "users"
end
