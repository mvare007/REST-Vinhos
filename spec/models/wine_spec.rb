require 'rails_helper'

RSpec.describe Wine, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:region) }
    it { should validate_presence_of(:volume) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_inclusion_of(:variant).in_array(%w(Tinto Branco Rosé Verde Espumante Sobremesa)) }
  end
end
