class Doccompra < ActiveRecord::Base

  has_many :imptoretencompras, dependent: :destroy
  has_many :mpagocompras, dependent: :destroy
  has_many :dscrcgglobalcompras, dependent: :destroy
  has_many :refdetcompras, dependent: :destroy
  has_many :comisioncompras, dependent: :destroy
  has_many :detcompras, dependent: :destroy

  accepts_nested_attributes_for :detcompras
  accepts_nested_attributes_for :imptoretencompras
  accepts_nested_attributes_for :mpagocompras
  accepts_nested_attributes_for :dscrcgglobalcompras
  accepts_nested_attributes_for :comisioncompras
  accepts_nested_attributes_for :refdetcompras
end