require 'rails_helper'

RSpec.describe Metadata, type: :model do
  context "Title attribute" do
    it 'Has a title attribute' do
      metadata = Metadata.new("<title>Hello World</title>").title
      expect(metadata).to eq('Hello World')
    end
    it 'Missing title attribute' do
      metadata = Metadata.new.title
      expect(metadata).to be_nil
    end
  end
  context 'Meta description' do
    it 'Has description' do
      metadata = Metadata.new("<meta name='description' content='Hello'").description
      expect(metadata).to eq('Hello')
    end
    it 'Missing description' do
      metadata = Metadata.new.description
      expect(metadata).to be_nil
    end
  end
  context 'Image description' do
    it 'image' do
      metadata = Metadata.new("<meta property='og:image' content='https://example.org/favicon.ico'").image
      expect(metadata).to eq('https://example.org/favicon.ico')
    end
    it 'Missing image' do
      metadata = Metadata.new.image
      expect(metadata).to be_nil
    end
  end
end
