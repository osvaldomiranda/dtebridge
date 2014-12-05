# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141204204945) do

  create_table "comisiones", force: true do |t|
    t.string   "NroLinCom"
    t.string   "integer"
    t.string   "TipoMovim"
    t.string   "string"
    t.string   "Glosa"
    t.string   "ValComNeto"
    t.string   "ValComExe"
    t.string   "ValComIVA"
    t.integer  "documento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comisiones", ["documento_id"], name: "index_comisiones_on_documento_id"

  create_table "detalles", force: true do |t|
    t.string   "NroLinDet"
    t.string   "integer"
    t.string   "TpoCodigo"
    t.string   "string"
    t.string   "VlrCodigo"
    t.string   "TpoDocLiq"
    t.string   "IndExe"
    t.string   "IndAgente"
    t.string   "MntBaseFaena"
    t.string   "MntMargComer"
    t.string   "PrcConsFinal"
    t.string   "NmbItem"
    t.string   "DscItem"
    t.string   "QtyRef"
    t.string   "UnmdRef"
    t.string   "PrcRef"
    t.string   "float"
    t.string   "QtyItem"
    t.string   "FchElabor"
    t.string   "FchVencim"
    t.string   "UnmdItem"
    t.float    "PrcItem"
    t.float    "DescuentoPct"
    t.string   "DescuentoMonto"
    t.string   "CodImpAdic"
    t.string   "MontoItem"
    t.integer  "documento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "detalles", ["documento_id"], name: "index_detalles_on_documento_id"

  create_table "documentos", force: true do |t|
    t.string   "TipoDTE"
    t.string   "integer"
    t.string   "Folio"
    t.string   "FchEmis"
    t.string   "string"
    t.string   "IndNoRebaja"
    t.string   "TipoDespacho"
    t.string   "IndTraslado"
    t.string   "TpoImpresion"
    t.string   "IndServicio"
    t.string   "MntBruto"
    t.string   "FmaPago"
    t.string   "FchVenc"
    t.string   "RUTEmisor"
    t.string   "RznSoc"
    t.string   "GiroEmis"
    t.string   "Telefono"
    t.string   "CorreoEmisor"
    t.string   "Acteco"
    t.string   "CdgTraslado"
    t.string   "FolioAut"
    t.string   "FchAut"
    t.string   "Sucursal"
    t.string   "CdgSIISucur"
    t.string   "CodAdicSucur"
    t.string   "DirOrigen"
    t.string   "CmnaOrigen"
    t.string   "CiudadOrigen"
    t.string   "CdgVendedor"
    t.string   "IdAdicEmisor"
    t.string   "RUTMandante"
    t.string   "RUTRecep"
    t.string   "CdgIntRecep"
    t.string   "RznSocRecep"
    t.string   "NumId"
    t.string   "Nacionalidad"
    t.string   "IdAdicRecep"
    t.string   "GiroRecep"
    t.string   "Contacto"
    t.string   "CorreoRecep"
    t.string   "DirRecep"
    t.string   "CmnaRecep"
    t.string   "CiudadRecep"
    t.string   "DirPostal"
    t.string   "CmnaPostal"
    t.string   "CiudadPostal"
    t.string   "RUTSolicita"
    t.string   "Patente"
    t.string   "RUTTrans"
    t.string   "RUTChofer"
    t.string   "NombreChofer"
    t.string   "DirDest"
    t.string   "CmnaDest"
    t.string   "CiudadDest"
    t.string   "CodModVenta"
    t.string   "CodClauVenta"
    t.string   "TotClauVenta"
    t.string   "CodViaTransp"
    t.string   "NombreTransp"
    t.string   "RUTCiaTransp"
    t.string   "NomCiaTransp"
    t.string   "IdAdicTransp"
    t.string   "Booking"
    t.string   "Operador"
    t.string   "CodPtoEmbarque"
    t.string   "IdAdicPtoEmb"
    t.string   "CodPtoDesemb"
    t.string   "IdAdicPtoDesemb"
    t.string   "Tara"
    t.string   "CodUnidMedTara"
    t.string   "PesoBruto"
    t.string   "CodUnidPesoBruto"
    t.string   "PesoNeto"
    t.string   "CodUnidPesoNeto"
    t.string   "TotItems"
    t.string   "TotBultos"
    t.string   "TpoMoneda"
    t.string   "MntNeto"
    t.string   "MntExe"
    t.string   "MntBase"
    t.string   "MntMargenCom"
    t.string   "TasaIVA"
    t.string   "float"
    t.string   "IVA"
    t.string   "IVAProp"
    t.string   "IVATerc"
    t.string   "IVANoRet"
    t.string   "CredEC"
    t.string   "GrntDep"
    t.string   "ValComNeto"
    t.string   "ValComExe"
    t.string   "ValComIVA"
    t.string   "MntTotal"
    t.string   "MontoNF"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dsc_rcg_globals", force: true do |t|
    t.string   "NroLinDR"
    t.string   "integer"
    t.string   "TpoMov"
    t.string   "string"
    t.string   "GlosaDR"
    t.string   "TpoValor"
    t.string   "ValorDR"
    t.string   "IndExeDR"
    t.integer  "documento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dsc_rcg_globals", ["documento_id"], name: "index_dsc_rcg_globals_on_documento_id"

  create_table "iat_logs", force: true do |t|
    t.text     "description"
    t.integer  "iat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "iat_logs", ["iat_id"], name: "index_iat_logs_on_iat_id"

  create_table "iats", force: true do |t|
    t.string   "nombre"
    t.string   "sucursal"
    t.date     "ultimo_ping"
    t.string   "auth_token"
    t.date     "ping_inicio"
    t.string   "espacio_disco"
    t.string   "memoria"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "iats", ["user_id"], name: "index_iats_on_user_id"

  create_table "impto_retens", force: true do |t|
    t.string   "TipoImp"
    t.string   "string"
    t.string   "TasaImp"
    t.string   "float"
    t.string   "MontoImp"
    t.string   "integer"
    t.integer  "documento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impto_retens", ["documento_id"], name: "index_impto_retens_on_documento_id"

  create_table "mnt_pagos", force: true do |t|
    t.string   "FchPago"
    t.string   "string"
    t.string   "MntPago"
    t.string   "integer"
    t.integer  "documento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mnt_pagos", ["documento_id"], name: "index_mnt_pagos_on_documento_id"

  create_table "pruebas", force: true do |t|
    t.string   "rut"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "referencia", force: true do |t|
    t.string   "NroLinRef"
    t.string   "integer"
    t.string   "TpoDocRef"
    t.string   "string"
    t.string   "IndGlobal"
    t.string   "FolioRef"
    t.string   "RUTOtr"
    t.string   "IdAdicOtr"
    t.string   "FchRef"
    t.string   "CodRef"
    t.string   "RazonRef"
    t.integer  "documento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "referencia", ["documento_id"], name: "index_referencia_on_documento_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "fono"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
