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

ActiveRecord::Schema.define(version: 20140806234453) do

  create_table "creditnotedetails", force: true do |t|
    t.integer  "NroLinDet"
    t.string   "TpoCodigo"
    t.string   "VlrCodigo"
    t.integer  "IndExe"
    t.string   "IndAgente"
    t.integer  "MntBaseFaena"
    t.integer  "MntMargComer"
    t.integer  "PrcConsFinal"
    t.string   "NmbItem"
    t.string   "DscItem"
    t.integer  "QtyRef"
    t.string   "UnmdRef"
    t.integer  "PrcRef"
    t.integer  "QtyItem"
    t.string   "UnmdItem"
    t.integer  "PrcItem"
    t.integer  "PrcOtrMon"
    t.string   "Moneda"
    t.integer  "FctConv"
    t.integer  "DctoOtrMnda"
    t.integer  "RecargoOtrMnda"
    t.string   "MontoItemOtrMnd"
    t.integer  "a"
    t.integer  "DescuentoPct"
    t.integer  "DescuentoMonto"
    t.string   "TipoDscto"
    t.integer  "ValorDscto"
    t.integer  "RecargoPct"
    t.integer  "RecargoMonto"
    t.string   "TipoRecargo"
    t.integer  "ValorRecargo"
    t.string   "CodImpAdic"
    t.integer  "MontoItem"
    t.integer  "creditnote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "creditnotedetails", ["creditnote_id"], name: "index_creditnotedetails_on_creditnote_id"

  create_table "creditnotes", force: true do |t|
    t.string   "Version"
    t.integer  "TipoDTE"
    t.integer  "Folio"
    t.date     "FchEmis"
    t.integer  "IndNoRebaja"
    t.integer  "IndServicio"
    t.integer  "MntBruto"
    t.integer  "FmaPago"
    t.string   "FchCancel"
    t.integer  "MntCancel"
    t.integer  "SaldoInsol"
    t.date     "FchPago"
    t.integer  "MntPago"
    t.string   "GlosaPagos"
    t.date     "PeriodoDesde"
    t.date     "PeriodoHasta"
    t.string   "MedioPago"
    t.string   "TipoCtaPago"
    t.string   "NumCtaPago"
    t.string   "BcoPago"
    t.string   "TermPagoCdg"
    t.string   "TermPagoGlosa"
    t.integer  "TermPagoDias"
    t.date     "FchVenc"
    t.string   "RUTEmisor"
    t.string   "RznSoc"
    t.string   "GiroEmis"
    t.string   "Telefono"
    t.string   "CorreoEmisor"
    t.integer  "Acteco"
    t.string   "Sucursal"
    t.integer  "CdgSIISucur"
    t.string   "DirOrigen"
    t.string   "CmnaOrigen"
    t.string   "CiudadOrigen"
    t.string   "CdgVendedor"
    t.string   "RUTMandante"
    t.string   "RUTRecep"
    t.string   "CdgIntRecep"
    t.string   "RznSocRecep"
    t.string   "NumId"
    t.string   "Nacionalidad"
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
    t.string   "RUTChofer"
    t.string   "NombreChofer"
    t.string   "DirDest"
    t.string   "CmnaDest"
    t.string   "CiudadDest"
    t.integer  "MntNeto"
    t.integer  "MntExe"
    t.integer  "MntBase"
    t.integer  "MntMargenCom"
    t.integer  "TasaIVA"
    t.integer  "IVA"
    t.integer  "IVAProp"
    t.integer  "IVATerc"
    t.string   "TipoImp"
    t.integer  "TasaImp"
    t.integer  "MontoImp"
    t.integer  "IVANoRet"
    t.integer  "CredEC"
    t.integer  "GrntDep"
    t.integer  "ValComNeto"
    t.integer  "ValComExe"
    t.integer  "ValComIVA"
    t.integer  "MntTotal"
    t.integer  "MontoNF"
    t.integer  "MontoPeriodo"
    t.integer  "SaldoAnterior"
    t.integer  "VlrPagar"
    t.string   "TpoMoneda"
    t.integer  "TpoCambio"
    t.integer  "MntNetoOtrMnda"
    t.integer  "MntExeOtrMnda"
    t.integer  "MntFaeCarneOtrMnda"
    t.integer  "MntMargComOtrMnda"
    t.integer  "IVAOtrMnda"
    t.string   "TipoImpOtrMnda"
    t.integer  "TasaImpOtrMnda"
    t.integer  "VlrImpOtrMnda"
    t.integer  "IVANoRetOtrMnda"
    t.integer  "MntTotOtrMnda"
    t.integer  "NroSti"
    t.text     "GlosaSti"
    t.integer  "OrdenSti"
    t.float    "SubTotNetoSti"
    t.float    "SubTotIVASti"
    t.float    "SubTotAdicSti"
    t.float    "SubTotExeSti"
    t.float    "ValSubTotSti"
    t.integer  "LineasDeta"
    t.integer  "NroLinDr"
    t.string   "TpoMov"
    t.string   "GlosaDr"
    t.string   "TpoValor"
    t.float    "ValorDr"
    t.float    "ValorDrOtrMnda"
    t.integer  "IndExeDr"
    t.integer  "NroLinRef"
    t.string   "TpoDocRef"
    t.integer  "IndGlobal"
    t.string   "FolioRef"
    t.string   "RUTOtr"
    t.date     "FchRef"
    t.integer  "CodRef"
    t.string   "RazonRef"
    t.integer  "NroLinCom"
    t.string   "TipoMovim"
    t.string   "Glosa"
    t.integer  "TasaComision"
    t.text     "X509Certificate"
    t.string   "SignatureValue"
    t.date     "Tmstfirma"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "debitnotedetails", force: true do |t|
    t.integer  "NroLinDet"
    t.string   "TpoCodigo"
    t.string   "VlrCodigo"
    t.integer  "IndExe"
    t.string   "IndAgente"
    t.integer  "MntBaseFaena"
    t.integer  "MntMargComer"
    t.integer  "PrcConsFinal"
    t.string   "NmbItem"
    t.string   "DscItem"
    t.integer  "QtyRef"
    t.string   "UnmdRef"
    t.integer  "PrcRef"
    t.integer  "QtyItem"
    t.string   "UnmdItem"
    t.integer  "PrcItem"
    t.integer  "PrcOtrMon"
    t.string   "Moneda"
    t.integer  "FctConv"
    t.integer  "DctoOtrMnda"
    t.integer  "RecargoOtrMnda"
    t.string   "MontoItemOtrMnd"
    t.integer  "a"
    t.integer  "DescuentoPct"
    t.integer  "DescuentoMonto"
    t.string   "TipoDscto"
    t.integer  "ValorDscto"
    t.integer  "RecargoPct"
    t.integer  "RecargoMonto"
    t.string   "TipoRecargo"
    t.integer  "ValorRecargo"
    t.string   "CodImpAdic"
    t.integer  "MontoItem"
    t.integer  "debitnote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "debitnotedetails", ["debitnote_id"], name: "index_debitnotedetails_on_debitnote_id"

  create_table "debitnotes", force: true do |t|
    t.string   "Version"
    t.integer  "TipoDTE"
    t.integer  "Folio"
    t.date     "FchEmis"
    t.integer  "IndServicio"
    t.integer  "MntBruto"
    t.integer  "FmaPago"
    t.string   "FchCancel"
    t.integer  "MntCancel"
    t.integer  "SaldoInsol"
    t.date     "FchPago"
    t.integer  "MntPago"
    t.string   "GlosaPagos"
    t.date     "PeriodoDesde"
    t.date     "PeriodoHasta"
    t.string   "MedioPago"
    t.string   "TipoCtaPago"
    t.string   "NumCtaPago"
    t.string   "BcoPago"
    t.string   "TermPagoCdg"
    t.string   "TermPagoGlosa"
    t.integer  "TermPagoDias"
    t.date     "FchVenc"
    t.string   "RUTEmisor"
    t.string   "RznSoc"
    t.string   "GiroEmis"
    t.string   "Telefono"
    t.string   "CorreoEmisor"
    t.integer  "Acteco"
    t.string   "Sucursal"
    t.integer  "CdgSIISucur"
    t.string   "DirOrigen"
    t.string   "CmnaOrigen"
    t.string   "CiudadOrigen"
    t.string   "CdgVendedor"
    t.string   "RUTMandante"
    t.string   "RUTRecep"
    t.string   "CdgIntRecep"
    t.string   "RznSocRecep"
    t.string   "NumId"
    t.string   "Nacionalidad"
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
    t.string   "RUTChofer"
    t.string   "NombreChofer"
    t.string   "DirDest"
    t.string   "CmnaDest"
    t.string   "CiudadDest"
    t.integer  "MntNeto"
    t.integer  "MntExe"
    t.integer  "MntBase"
    t.integer  "MntMargenCom"
    t.integer  "TasaIVA"
    t.integer  "IVA"
    t.integer  "IVAProp"
    t.integer  "IVATerc"
    t.string   "TipoImp"
    t.integer  "TasaImp"
    t.integer  "MontoImp"
    t.integer  "IVANoRet"
    t.integer  "CredEC"
    t.integer  "GrntDep"
    t.integer  "ValComNeto"
    t.integer  "ValComExe"
    t.integer  "ValComIVA"
    t.integer  "MntTotal"
    t.integer  "MontoNF"
    t.integer  "MontoPeriodo"
    t.integer  "SaldoAnterior"
    t.integer  "VlrPagar"
    t.string   "TpoMoneda"
    t.integer  "TpoCambio"
    t.integer  "MntNetoOtrMnda"
    t.integer  "MntExeOtrMnda"
    t.integer  "MntFaeCarneOtrMnda"
    t.integer  "MntMargComOtrMnda"
    t.integer  "IVAOtrMnda"
    t.string   "ImpRetOtrMnda"
    t.string   "TipoImpOtrMnda"
    t.integer  "TasaImpOtrMnda"
    t.integer  "VlrImpOtrMnda"
    t.integer  "IVANoRetOtrMnda"
    t.integer  "MntTotOtrMnda"
    t.integer  "NroSti"
    t.text     "GlosaSti"
    t.integer  "OrdenSti"
    t.float    "SubTotNetoSti"
    t.float    "SubTotIVASti"
    t.float    "SubTotAdicSti"
    t.float    "SubTotExeSti"
    t.float    "ValSubTotSti"
    t.integer  "LineasDeta"
    t.integer  "NroLinDr"
    t.string   "TpoMov"
    t.string   "GlosaDr"
    t.string   "TpoValor"
    t.float    "ValorDr"
    t.float    "ValorDrOtrMnda"
    t.integer  "IndExeDr"
    t.integer  "NroLinRef"
    t.string   "TpoDocRef"
    t.integer  "IndGlobal"
    t.string   "FolioRef"
    t.string   "RUTOtr"
    t.date     "FchRef"
    t.integer  "CodRef"
    t.string   "RazonRef"
    t.integer  "NroLinCom"
    t.string   "TipoMovim"
    t.string   "Glosa"
    t.integer  "TasaComision"
    t.text     "X509Certificate"
    t.string   "SignatureValue"
    t.date     "Tmstfirma"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "detallefacturas", force: true do |t|
    t.integer  "NroLinDet"
    t.string   "TipoCodigo"
    t.string   "VlrCodigo"
    t.integer  "IndExe"
    t.string   "IndAgente"
    t.integer  "MntBaseFaena"
    t.integer  "MntMargComer"
    t.integer  "PrcConsFinal"
    t.string   "NmbItem"
    t.string   "DscItem"
    t.float    "QtyRef"
    t.string   "UnmdRef"
    t.integer  "PrcRef"
    t.float    "QtyItem"
    t.float    "SubQty"
    t.date     "FchElabor"
    t.date     "FchVencim"
    t.string   "UnmdItem"
    t.float    "PrcItem"
    t.integer  "PrcOtrMon"
    t.string   "Moneda"
    t.float    "FctConv"
    t.float    "DctoOtrMnda"
    t.float    "RecargoOtrMnda"
    t.float    "MontoItemOtrMnda"
    t.float    "DescuentoPct"
    t.integer  "DescuentoMonto"
    t.string   "TipoDscto"
    t.float    "ValorDscto"
    t.float    "RecargoPct"
    t.integer  "RecargoMonto"
    t.string   "TipoRecargo"
    t.integer  "ValorRecargo"
    t.string   "CodImpAdic"
    t.integer  "MontoItem"
    t.integer  "factura_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "detallefacturas", ["factura_id"], name: "index_detallefacturas_on_factura_id"

  create_table "guidedetails", force: true do |t|
    t.integer  "NroLinDet"
    t.string   "TpoCodigo"
    t.string   "VlrCodigo"
    t.integer  "IndExe"
    t.string   "IndAgente"
    t.integer  "MntBaseFaena"
    t.integer  "MntMargComer"
    t.integer  "PrcConsFinal"
    t.string   "NmbItem"
    t.string   "DscItem"
    t.integer  "QtyRef"
    t.string   "UnmdRef"
    t.integer  "PrcRef"
    t.integer  "QtyItem"
    t.integer  "SubQty"
    t.string   "SubCod"
    t.string   "FchElabor"
    t.string   "FchVencim"
    t.string   "UnmdItem"
    t.integer  "PrcItem"
    t.integer  "PrcOtrMon"
    t.string   "Moneda"
    t.integer  "FctConv"
    t.integer  "DctoOtrMnda"
    t.integer  "RecargoOtrMnda"
    t.integer  "MontoItemOtrMnda"
    t.integer  "DescuentoPct"
    t.integer  "DescuentoMonto"
    t.string   "TipoDscto"
    t.integer  "ValorDscto"
    t.integer  "RecargoPct"
    t.integer  "RecargoMonto"
    t.string   "TipoRecargo"
    t.integer  "ValorRecargo"
    t.string   "CodImpAdic"
    t.integer  "MontoItem"
    t.integer  "guide_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guidedetails", ["guide_id"], name: "index_guidedetails_on_guide_id"

  create_table "guides", force: true do |t|
    t.integer  "Version"
    t.integer  "TipoDTE"
    t.integer  "Folio"
    t.date     "FchEmis"
    t.integer  "TipoDespacho"
    t.integer  "IndTraslado"
    t.string   "TpoImpresion"
    t.integer  "FmaPago"
    t.integer  "FmaPagExp"
    t.string   "FchCancel"
    t.integer  "MntCancel"
    t.integer  "SaldoInsol"
    t.string   "FchPago"
    t.integer  "MntPago"
    t.string   "GlosaPagos"
    t.string   "TermPagoCdg"
    t.string   "TermPagoGlosa"
    t.integer  "TermPagoDias"
    t.string   "RUTEmisor"
    t.string   "RznSoc"
    t.string   "GiroEmis"
    t.string   "Telefono"
    t.string   "CorreoEmisor"
    t.integer  "Acteco"
    t.integer  "CdgTraslado"
    t.integer  "FolioAut"
    t.date     "FchAut"
    t.string   "Sucursal"
    t.integer  "CdgSIISucur"
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
    t.string   "GiroRecep"
    t.string   "Contacto"
    t.string   "CorreoRecep"
    t.string   "DirRecep"
    t.string   "CmnaRecep"
    t.string   "CiudadRecep"
    t.string   "DirPostal"
    t.string   "CmnaPostal"
    t.string   "CiudadPostal"
    t.string   "Patente"
    t.string   "RUTTrans"
    t.string   "RUTChofer"
    t.string   "NombreChofer"
    t.string   "DirDest"
    t.string   "CmnaDest"
    t.string   "CiudadDest"
    t.integer  "CodModVenta"
    t.integer  "CodClauVenta"
    t.integer  "TotClauVenta"
    t.integer  "CodViaTransp"
    t.string   "NombreTransp"
    t.string   "RUTCiaTransp"
    t.string   "NomCiaTransp"
    t.string   "IdAdicTransp"
    t.string   "Booking"
    t.string   "Operador"
    t.integer  "CodPtoEmbarque"
    t.string   "IdAdicPtoEmb"
    t.integer  "CodPtoDesemb"
    t.string   "IdAdicPtoDesemb"
    t.integer  "Tara"
    t.integer  "CodUnidMedTara"
    t.integer  "CodUnidPesoBruto"
    t.integer  "PesoBruto"
    t.integer  "PesoNeto"
    t.integer  "CodUnidPesoNeto"
    t.integer  "TotItems"
    t.integer  "TotBultos"
    t.string   "TipoBultos"
    t.integer  "CodTpoBultos"
    t.integer  "CantBultos"
    t.string   "Marcas"
    t.string   "IdContainer"
    t.string   "Sello"
    t.string   "EmisorSello"
    t.string   "MntFlete"
    t.string   "MntSeguro"
    t.string   "CodPaisRecep"
    t.string   "CodPaisDestin"
    t.integer  "MntNeto"
    t.integer  "MntExe"
    t.integer  "MntBase"
    t.integer  "MntMargenCom"
    t.integer  "TasaIVA"
    t.float    "IVA"
    t.integer  "IVAProp"
    t.integer  "IVATerc"
    t.string   "TipoImp"
    t.integer  "TasaImp"
    t.integer  "MontoImp"
    t.integer  "CredEC"
    t.integer  "MntTotal"
    t.integer  "MontoNF"
    t.integer  "MontoPeriodo"
    t.integer  "SaldoAnterior"
    t.integer  "VlrPagar"
    t.string   "TpoMoneda"
    t.integer  "TpoCambio"
    t.integer  "MntNetoOtrMnda"
    t.integer  "MntExeOtrMnda"
    t.string   "MntFaeCarneOtr"
    t.integer  "Mnda"
    t.string   "MntMargComOtr"
    t.integer  "IVAOtrMnda"
    t.string   "TipoImpOtrMnda"
    t.integer  "TasaImpOtrMnda"
    t.integer  "VlrImpOtrMnda"
    t.integer  "MntTotOtrMnda"
    t.string   "NroSti"
    t.string   "integer"
    t.string   "GlosaSti"
    t.string   "text"
    t.string   "OrdenSti"
    t.string   "SubTotNetoSti"
    t.string   "float"
    t.string   "SubTotIVASti"
    t.string   "SubTotAdicSti"
    t.string   "SubTotExeSti"
    t.string   "ValSubTotSti"
    t.string   "LineasDeta"
    t.integer  "NroLinDr"
    t.string   "TpoMov"
    t.string   "GlosaDr"
    t.string   "TpoValor"
    t.float    "ValorDr"
    t.float    "ValorDrOtrMnda"
    t.integer  "IndExeDr"
    t.integer  "NroLinRef"
    t.string   "TpoDocRef"
    t.integer  "IndGlobal"
    t.string   "FolioRef"
    t.date     "FchRef"
    t.integer  "CodRef"
    t.string   "RazonRef"
    t.text     "X509Certificate"
    t.string   "SignatureValue"
    t.date     "Tmstfirma"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "invoicedetails", force: true do |t|
    t.integer  "NroLinDet"
    t.string   "TpoCodigo"
    t.string   "VlrCodigo"
    t.integer  "IndExe"
    t.string   "IndAgente"
    t.integer  "MntBaseFaena"
    t.integer  "MntMargComer"
    t.integer  "PrcConsFinal"
    t.string   "NmbItem"
    t.string   "DscItem"
    t.float    "QtyRef"
    t.string   "UnmdRef"
    t.integer  "PrcRef"
    t.float    "QtyItem"
    t.float    "SubQty"
    t.string   "SubCod"
    t.date     "FchElabor"
    t.date     "FchVencim"
    t.string   "UnmdItem"
    t.float    "PrcItem"
    t.integer  "PrcOtrMon"
    t.string   "Moneda"
    t.float    "FctConv"
    t.float    "DctoOtrMnda"
    t.float    "RecargoOtrMnda"
    t.float    "MontoItemOtrMnda"
    t.float    "DescuentoPct"
    t.integer  "DescuentoMonto"
    t.string   "TipoDscto"
    t.float    "ValorDscto"
    t.float    "RecargoPct"
    t.integer  "RecargoMonto"
    t.string   "TipoRecargo"
    t.integer  "ValorRecargo"
    t.string   "CodImpAdic"
    t.integer  "MontoItem"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoicedetails", ["invoice_id"], name: "index_invoicedetails_on_invoice_id"

  create_table "invoices", force: true do |t|
    t.string   "Version"
    t.integer  "TipoDte"
    t.integer  "Folio"
    t.date     "FchEmis"
    t.string   "TipoDespacho"
    t.integer  "IndServicio"
    t.integer  "MntBruto"
    t.integer  "FmaPago"
    t.date     "FchCancel"
    t.integer  "MntCancel"
    t.integer  "SaldoInsol"
    t.date     "FchPago"
    t.integer  "MntPago"
    t.string   "GlosaPagos"
    t.date     "PeriodoDesde"
    t.date     "PeriodoHasta"
    t.string   "MedioPago"
    t.string   "TipoCtaPAgo"
    t.string   "NumCtaPago"
    t.string   "BcoPago"
    t.string   "TermPagoCdg"
    t.string   "TermPAgoGlosa"
    t.integer  "TermPagoDias"
    t.date     "FchVenc"
    t.string   "RUTEmisor"
    t.string   "RznSoc"
    t.string   "GiroEmis"
    t.string   "Telefono"
    t.string   "CorreoEmisor"
    t.integer  "Acteco"
    t.string   "Sucursal"
    t.integer  "CdgSIISucur"
    t.string   "DirOrigen"
    t.string   "CmnaOrigen"
    t.string   "CiudadOrigen"
    t.string   "CdgVendedor"
    t.string   "RutMandante"
    t.string   "RUTReceptor"
    t.string   "CdgIntRecep"
    t.string   "RznSocRecep"
    t.string   "NumId"
    t.string   "Nacionalidad"
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
    t.string   "RUTTRans"
    t.string   "RUTChofer"
    t.string   "NombreChofer"
    t.string   "DirDest"
    t.string   "CmnaDest"
    t.string   "CiudadDest"
    t.integer  "MntNeto"
    t.integer  "MntExe"
    t.integer  "MntBase"
    t.integer  "MntMargenCom"
    t.float    "TasaIVA"
    t.integer  "IVA"
    t.integer  "IVAProp"
    t.integer  "IVATerc"
    t.string   "TipoImp"
    t.integer  "TasaImp"
    t.integer  "MontoImp"
    t.integer  "CredEC"
    t.integer  "GmtDep"
    t.integer  "MntTotal"
    t.integer  "MontoNF"
    t.integer  "MontoPeriodo"
    t.integer  "SaldoAnterior"
    t.integer  "VlrPagar"
    t.string   "TpoMoneda"
    t.integer  "TpoCambio"
    t.float    "MntNetoOtrMnda"
    t.float    "MntExeOtrMnda"
    t.float    "MntFaeCarneOtrMnda"
    t.integer  "MntMargComOtrMnda"
    t.float    "IVAOtrMnda"
    t.string   "TipoImpOtrMnda"
    t.integer  "TasaImpOtrMnda"
    t.integer  "VlrImpOtrMnda"
    t.float    "MntTotOtrMnda"
    t.string   "NroSti"
    t.string   "integer"
    t.string   "GlosaSti"
    t.string   "text"
    t.string   "OrdenSti"
    t.string   "SubTotNetoSti"
    t.string   "float"
    t.string   "SubTotIVASti"
    t.string   "SubTotAdicSti"
    t.string   "SubTotExeSti"
    t.string   "ValSubTotSti"
    t.string   "LineasDeta"
    t.integer  "NroLinDr"
    t.string   "TpoMov"
    t.string   "GlosaDr"
    t.string   "TpoValor"
    t.float    "ValorDr"
    t.float    "ValorDrOtrMnda"
    t.integer  "IndExeDr"
    t.integer  "NroLinRef"
    t.string   "TpoDocRef"
    t.integer  "IndGlobal"
    t.string   "FolioRef"
    t.date     "FchRef"
    t.integer  "CodRef"
    t.string   "RazonRef"
    t.text     "X509Certificate"
    t.string   "SignatureValue"
    t.date     "Tmstfirma"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.binary   "Pdf"
    t.binary   "Xml"
  end

  create_table "pruebas", force: true do |t|
    t.string   "rut"
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
