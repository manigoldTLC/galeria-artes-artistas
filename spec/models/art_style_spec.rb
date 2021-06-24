require 'rails_helper'

RSpec.describe ArtStyle, type: :model do
  context 'name validity' do
    it 'name is ok' do
      artstyle = build(:art_style)
      expect(artstyle).to be_valid
    end

    it 'name is null' do
      artstyle = build(:art_style, name: '')
      expect(artstyle).to_not be_valid
    end

    it 'name is shorter than 3 chars' do
      artstyle = build(:art_style, name: '12')
      expect(artstyle).to_not be_valid
    end
  end

  context 'description validity' do
    it 'description is ok' do
      artstyle = build(:art_style)
      expect(artstyle).to be_valid
    end

    it 'description is null' do
      artstyle = build(:art_style, name: '')
      expect(artstyle).to_not be_valid
    end

    it 'description is longer than 200 chars' do
      artstyle = build(:art_style, description: 'Desde o tempo das civilizações castrejas, que há relatos sobre loções e cremes milagrosos feitos com as propriedades mágicas da conhecida alga do rio lima, combinada com os microcristais graníticos da serra de arga.
        Mais tarde, já durante a era romana, estes preciosos produtos cosméticos eram enviados para Roma sob a mais cerrada vigilância, onde imperadores e generais se deleitavam em prolongados banhos hedonísticos.
        No entanto, é só em meados do séc. XVI que o famoso boticário da corte Tiniana- Diogo Bernardes – desenvolve a misteriosa receita final que aqui apresentamos.
        Pérola do Lima, é muito mais do que um sabão.')
      expect(artstyle).to_not be_valid
    end
  end
end
