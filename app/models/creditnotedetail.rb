class Creditnotedetail < ActiveRecord::Base
	belongs_to :creditnote
	validates :NroLinDet, length:{maximum: 4}, presence: true
	validates :TpoCodigo, length:{maximum: 10}
	validates :VlrCodigo, length:{maximum: 35}
	validates :IndExe, length:{maximum: 1}
	validates :IndAgente, length:{maximum: 1}
	validates :MntBaseFaena, length:{maximum: 18}
	validates :MntMargComer, length:{maximum: 18}
	validates :PrcConsFinal, length:{maximum: 18}
	validates :NmbItem, length:{maximum: 80}, presence: true
	validates :DscItem, length:{maximum: 1000}
	validates :QtyRef, length:{maximum: 18}
	validates :UnmdRef, length:{maximum: 4}
	validates :PrcRef, length:{maximum: 18}
	validates :QtyItem, length:{maximum: 18}
	validates :UnmdItem, length:{maximum: 4}
	validates :PrcItem, length:{maximum: 18}
	validates :PrcOtrMon, length:{maximum: 18}
	validates :Moneda, length:{maximum: 3}
	validates :FctConv, length:{maximum: 10}
	validates :DctoOtrMnda, length:{maximum: 18}
	validates :RecargoOtrMnda, length:{maximum: 18}
	validates :MontoItemOtrMnda, length:{maximum: 18}
	validates :DescuentoPct, length:{maximum: 5}
	validates :DescuentoMonto, length:{maximum: 18}
	validates :TipoDscto, length:{maximum: 1}
	validates :ValorDscto, length:{maximum: 18}
	validates :RecargoPct, length:{maximum: 5}
	validates :RecargoMonto, length:{maximum: 18}
	validates :TipoRecargo, length:{maximum: 1}
	validates :ValorRecargo, length:{maximum: 18}
	validates :CodImpAdic, length:{maximum: 6}
	validates :MontoItem, length:{maximum: 18}, presence: true

end
