require 'rails_helper'
RSpec.describe Base62, type: :model do
  context 'when #encode' do
    it '1' do
      expect(Base62.encode(1)).to eq('1')
    end

    it '10' do
      expect(Base62.encode(10)).to eq('a')
    end

    it '1024' do
      expect(Base62.encode(1024)).to eq('gw')
    end

    it '1028211320090255192418253018' do
      expect(Base62.encode(1830251824951250902013212810)).to eq('2nzX76bbOMMWZ47g')
    end
  end

  context 'when #decode' do
    it '1' do
      expect(Base62.decode('1')).to eq(1)
    end

    it 'a' do
      expect(Base62.decode('a')).to eq(10)
    end

    it 'gw' do
      expect(Base62.decode('gw')).to eq(1024)
    end

    it '2nzX76bbOMMWZ47g' do
      expect(Base62.decode('2nzX76bbOMMWZ47g')).to eq(1830251824951250902013212810)
    end
  end
end
