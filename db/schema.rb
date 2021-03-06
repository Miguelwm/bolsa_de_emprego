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

ActiveRecord::Schema.define(version: 20170621103029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actividade_profissionals", force: :cascade do |t|
    t.string   "actividade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "area_profissionals", force: :cascade do |t|
    t.string   "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidatos", force: :cascade do |t|
    t.date     "nascimento"
    t.string   "bi"
    t.text     "habilitacao"
    t.text     "experiencia"
    t.string   "cv"
    t.integer  "perfil_id"
    t.integer  "area_profissional_id"
    t.integer  "nivel_habilitacao_id"
    t.integer  "situacao_profissional_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user"
    t.index ["area_profissional_id"], name: "index_candidatos_on_area_profissional_id", using: :btree
    t.index ["nivel_habilitacao_id"], name: "index_candidatos_on_nivel_habilitacao_id", using: :btree
    t.index ["perfil_id"], name: "index_candidatos_on_perfil_id", using: :btree
    t.index ["situacao_profissional_id"], name: "index_candidatos_on_situacao_profissional_id", using: :btree
  end

  create_table "candidaturas", force: :cascade do |t|
    t.integer  "candidato_id"
    t.integer  "oferta_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["candidato_id", "oferta_id"], name: "index_candidaturas_on_candidato_id_and_oferta_id", unique: true, using: :btree
    t.index ["candidato_id"], name: "index_candidaturas_on_candidato_id", using: :btree
    t.index ["oferta_id"], name: "index_candidaturas_on_oferta_id", using: :btree
  end

  create_table "contas", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
    t.boolean  "activo",          default: false
    t.string   "password_digest"
    t.integer  "user"
    t.string   "activo_digest"
    t.datetime "ativado_em"
    t.string   "lembrar_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "tipo"
    t.boolean  "destaque",        default: false
    t.boolean  "novo",            default: true
    t.boolean  "newsletter",      default: false
    t.boolean  "candidatos",      default: false
    t.boolean  "entidades",       default: false
    t.boolean  "ofertas",         default: false
    t.boolean  "candidaturas",    default: false
  end

  create_table "entidades", force: :cascade do |t|
    t.string   "nif"
    t.integer  "perfil_id"
    t.integer  "actividade_profissional_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user"
    t.index ["actividade_profissional_id"], name: "index_entidades_on_actividade_profissional_id", using: :btree
    t.index ["perfil_id"], name: "index_entidades_on_perfil_id", using: :btree
  end

  create_table "interesses", force: :cascade do |t|
    t.integer  "interessado_id"
    t.integer  "interessado_em_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["interessado_em_id"], name: "index_interesses_on_interessado_em_id", using: :btree
    t.index ["interessado_id", "interessado_em_id"], name: "index_interesses_on_interessado_id_and_interessado_em_id", unique: true, using: :btree
    t.index ["interessado_id"], name: "index_interesses_on_interessado_id", using: :btree
  end

  create_table "newsletters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nivel_habilitacaos", force: :cascade do |t|
    t.string   "nivel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "noticias", force: :cascade do |t|
    t.string   "titulo"
    t.date     "data"
    t.text     "sumario"
    t.text     "texto"
    t.boolean  "destaque"
    t.boolean  "activo"
    t.integer  "conta_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.string   "foto"
    t.index ["conta_id"], name: "index_noticias_on_conta_id", using: :btree
  end

  create_table "ofertas", force: :cascade do |t|
    t.string   "titulo"
    t.date     "val_inicio"
    t.date     "val_fim"
    t.text     "descricao"
    t.boolean  "activo",               default: false
    t.integer  "entidade_id"
    t.integer  "area_profissional_id"
    t.integer  "tipo_contrato_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "salario_id"
    t.string   "picture"
    t.string   "foto"
    t.boolean  "novo",                 default: true
    t.index ["area_profissional_id"], name: "index_ofertas_on_area_profissional_id", using: :btree
    t.index ["entidade_id"], name: "index_ofertas_on_entidade_id", using: :btree
    t.index ["salario_id"], name: "index_ofertas_on_salario_id", using: :btree
    t.index ["tipo_contrato_id"], name: "index_ofertas_on_tipo_contrato_id", using: :btree
  end

  create_table "perfils", force: :cascade do |t|
    t.text     "morada"
    t.string   "codigo_postal"
    t.string   "localidade"
    t.string   "contacto1"
    t.string   "contacto2"
    t.string   "pagina"
    t.text     "apresentacao"
    t.integer  "conta_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "foto"
    t.integer  "user"
    t.index ["conta_id"], name: "index_perfils_on_conta_id", using: :btree
  end

  create_table "salarios", force: :cascade do |t|
    t.string   "quantia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "situacao_profissionals", force: :cascade do |t|
    t.string   "situacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_contratos", force: :cascade do |t|
    t.string   "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "candidatos", "area_profissionals"
  add_foreign_key "candidatos", "nivel_habilitacaos"
  add_foreign_key "candidatos", "perfils"
  add_foreign_key "candidatos", "situacao_profissionals"
  add_foreign_key "entidades", "actividade_profissionals"
  add_foreign_key "entidades", "perfils"
  add_foreign_key "noticias", "contas"
  add_foreign_key "ofertas", "area_profissionals"
  add_foreign_key "ofertas", "entidades"
  add_foreign_key "ofertas", "salarios"
  add_foreign_key "ofertas", "tipo_contratos"
  add_foreign_key "perfils", "contas"
end
