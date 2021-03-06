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

ActiveRecord::Schema.define(version: 2020_07_31_151807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'likes', force: :cascade do |t|
    t.bigint 'spot_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['spot_id'], name: 'index_likes_on_spot_id'
    t.index ['user_id', 'spot_id'], name: 'index_likes_on_user_id_and_spot_id', unique: true
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'spot_comments', force: :cascade do |t|
    t.text 'content'
    t.bigint 'user_id'
    t.bigint 'spot_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['spot_id'], name: 'index_spot_comments_on_spot_id'
    t.index ['user_id', 'spot_id'], name: 'index_spot_comments_on_user_id_and_spot_id', unique: true
    t.index ['user_id'], name: 'index_spot_comments_on_user_id'
  end

  create_table 'spots', force: :cascade do |t|
    t.string 'title'
    t.string 'description'
    t.string 'string'
    t.string 'mood'
    t.string 'latitude'
    t.string 'float'
    t.string 'longitude'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'picture'
    t.bigint 'user_id'
    t.boolean 'is_excite_place'
    t.index ['id', 'user_id'], name: 'index_spots_on_id_and_user_id'
    t.index ['user_id'], name: 'index_spots_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'provider', default: 'email', null: false
    t.string 'uid', default: '', null: false
    t.string 'username'
    t.boolean 'admin', default: false
    t.text 'tokens'
    t.boolean 'allow_password_change', default: false, null: false
    t.string 'picture'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['uid', 'provider'], name: 'index_users_on_uid_and_provider', unique: true
  end

  add_foreign_key 'likes', 'spots'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'spot_comments', 'spots'
  add_foreign_key 'spot_comments', 'users'
  add_foreign_key 'spots', 'users'
end
