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

ActiveRecord::Schema.define(version: 2016_02_24_183028) do

  create_table "cache_arp", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "mac_address", null: false, comment: "use with hex() function", unsigned: true
    t.integer "ip_address", null: false, comment: "use with INET_ATON() function", unsigned: true
    t.datetime "created"
    t.index ["ip_address"], name: "ip_address_UNIQUE", unique: true
    t.index ["mac_address"], name: "mac_address_UNIQUE", unique: true
  end

  create_table "cache_switches", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 100
  end

  create_table "connections", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "subject"
    t.integer "interface0_id", null: false
    t.integer "interface1_id", null: false
    t.index ["interface0_id"], name: "fk_connections_interfaces1_idx"
    t.index ["interface1_id"], name: "fk_connections_interfaces2_idx"
  end

  create_table "container_slots", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "baias dos racks\n", force: :cascade do |t|
    t.string "title", limit: 100
    t.integer "container_id", null: false
    t.integer "device_id"
    t.index ["container_id"], name: "fk_container_slots_containers1_idx"
    t.index ["device_id"], name: "index_container_slots_on_device_id"
  end

  create_table "container_types", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.integer "slots"
    t.boolean "nested"
  end

  create_table "containers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "racks, caixas, engradados...\n", force: :cascade do |t|
    t.string "title", limit: 100
    t.integer "place_id", null: false
    t.integer "item_id"
    t.integer "container_type_id", null: false
    t.boolean "reverse"
    t.integer "container_id"
    t.index ["container_id"], name: "fk_containers_containers1_idx"
    t.index ["container_type_id"], name: "fk_containers_container_types1_idx"
    t.index ["item_id"], name: "fk_containers_items1_idx"
    t.index ["place_id"], name: "fk_containers_places_idx"
  end

  create_table "device_brands", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "marcas dos dispositivos, como HP, IBM..\n", force: :cascade do |t|
    t.string "title", limit: 100, null: false
  end

  create_table "device_model_params", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.integer "device_model_id", null: false
    t.integer "param_id", null: false
    t.index ["device_model_id"], name: "fk_device_model_params_device_models1_idx"
    t.index ["param_id"], name: "fk_device_model_params_params1_idx"
  end

  create_table "device_models", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.integer "device_brand_id", null: false
    t.integer "device_type_id", null: false
    t.integer "rack_units"
    t.integer "ethernet_interfaces"
    t.integer "fiber_interfaces"
    t.string "stock_unit", limit: 100
    t.index ["device_brand_id"], name: "fk_device_models_device_brands1_idx"
    t.index ["device_type_id"], name: "fk_device_models_device_types1_idx"
  end

  create_table "device_types", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "tipos de servidor ou ativos de rede. como switch, servidor, etc..\n", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.index ["title"], name: "title_UNIQUE", unique: true
  end

  create_table "devices", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "ativos de rede e servidores\n", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.integer "item_id"
    t.integer "device_model_id", null: false
    t.string "ip"
    t.string "host"
    t.string "description"
    t.boolean "unknown", default: false, null: false
    t.index ["device_model_id"], name: "fk_devices_device_models1_idx"
    t.index ["item_id"], name: "fk_devices_item_idx"
  end

  create_table "interface_types", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.index ["title"], name: "title_UNIQUE", unique: true
  end

  create_table "interfaces", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.integer "device_id", null: false
    t.string "address", limit: 100
    t.integer "interface_type_id", null: false
    t.string "mac", limit: 100
    t.index ["device_id"], name: "fk_interfaces_devices1_idx"
    t.index ["interface_type_id"], name: "fk_interfaces_interface_types1_idx"
  end

  create_table "items", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=koi8r COLLATE=koi8r_bin", comment: "numeros de tombos, migrado da planilia do excel\n", force: :cascade do |t|
    t.integer "number", null: false
    t.string "title", limit: 100, null: false, collation: "latin1_swedish_ci"
    t.string "brand_name", collation: "latin1_swedish_ci"
    t.string "model_description", collation: "latin1_swedish_ci"
    t.string "serial_number", collation: "latin1_swedish_ci"
    t.date "warranty_date"
    t.decimal "value", precision: 10
    t.decimal "net_value", precision: 10
    t.text "allocation", collation: "latin1_swedish_ci"
    t.index ["number"], name: "number_UNIQUE", unique: true
  end

  create_table "params", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "parâmetros extras, como: peso, altura, comprimento", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.string "unit", limit: 100, null: false
  end

  create_table "places", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "salas como o dc1, dc2 ou estoque sme, estoque 5 andar", force: :cascade do |t|
    t.string "title", limit: 100, null: false
  end

  create_table "stock_item_instances", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "cada unidade do item de estoque separado, exemplo: um cabo de forca\n", force: :cascade do |t|
    t.integer "stock_item_id", null: false
    t.integer "container_id", null: false
    t.boolean "supplied", default: false, null: false, comment: "fornecido 1\nem estoque 0"
    t.datetime "supplied_date"
    t.string "supplied_to", limit: 200, comment: "para quem foi fornecido\n"
    t.text "comment"
    t.datetime "created"
    t.datetime "modified"
    t.index ["container_id"], name: "fk_stock_item_instances_containers1_idx"
    t.index ["stock_item_id"], name: "fk_stock_item_instances_stock_items1_idx"
  end

  create_table "stock_items", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.integer "item_id"
    t.integer "quantity"
    t.boolean "is_package", default: false, null: false
    t.integer "package_quantity"
    t.index ["item_id"], name: "fk_stock_item_items1_idx"
  end

  create_table "stock_param_values", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "value", null: false
    t.integer "stock_item_id", null: false
    t.integer "param_id", null: false
    t.index ["param_id"], name: "fk_stock_param_values_params1_idx"
    t.index ["stock_item_id"], name: "fk_stock_param_value_stock_item1_idx"
  end

  add_foreign_key "connections", "interfaces", column: "interface0_id", name: "fk_connections_interfaces1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "connections", "interfaces", column: "interface1_id", name: "fk_connections_interfaces2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "container_slots", "containers", name: "fk_container_slots_containers1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "container_slots", "devices"
  add_foreign_key "containers", "container_types", name: "fk_containers_container_types1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "containers", "containers", name: "fk_containers_containers1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "containers", "items", name: "fk_containers_items1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "containers", "places", name: "fk_containers_places", on_update: :cascade, on_delete: :cascade
  add_foreign_key "device_model_params", "device_models", name: "fk_device_model_params_device_models1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "device_model_params", "params", name: "fk_device_model_params_params1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "device_models", "device_brands", name: "fk_device_models_device_brands1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "device_models", "device_types", name: "fk_device_models_device_types1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "devices", "device_models", name: "fk_devices_device_models1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "devices", "items", name: "fk_devices_items1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "interfaces", "devices", name: "fk_interfaces_devices1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "interfaces", "interface_types", name: "fk_interfaces_interface_types1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "stock_item_instances", "containers", name: "fk_stock_item_instances_containers1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "stock_item_instances", "stock_items", name: "fk_stock_item_instances_stock_items1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "stock_items", "items", name: "fk_stock_item_items1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "stock_param_values", "params", name: "fk_stock_param_values_params1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "stock_param_values", "stock_items", name: "fk_stock_param_value_stock_item1", on_update: :cascade, on_delete: :cascade
end
