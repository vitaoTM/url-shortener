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
  end

  context 'when #decode' do
    it '1' do
      expect(Base62.decode('a')).to eq(10)
    end
  end
end
