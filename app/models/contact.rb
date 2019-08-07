class Contact < ApplicationRecord
  has_many :phones, dependent: :destroy, inverse_of: :contact # a concordancia é importante, o plural
  # COMENTÁRIOS: Aqui declaramos a associação entre os models e adicionamos o dependent: :destroy para eliminar as experiencias caso o usuário seja deletado

  has_one :adress, dependent: :destroy # no singular

  has_many :contact_kinds # contact possui muitos <tabela intermediaria>
  has_many :kinds, through: :kinds # contact possui muitos kinds atraves de <tabela intermediaria>

  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
    # COMENTÁRIO: O reject_if: :all blank faz com que não seja salvo um record caso o usuário tente adicionar uma experiência com todos os campos vazios
  accepts_nested_attributes_for :adress
end
