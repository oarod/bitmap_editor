require_relative '../app/bitmap_editor'
require_relative 'spec_helper';

describe BitmapEditor do
  subject { BitmapEditor.new }

  describe :create_bitmap do
    it 'should create bitmap' do
      expected = [
        ['O', 'O', 'O'],
        ['O', 'O', 'O'],
        ['O', 'O', 'O'],
        ['O', 'O', 'O'],
        ['O', 'O', 'O']
      ]

      subject.create_bitmap ['3', '5']

      expect(subject.bitmap).to eq expected
    end
  end
end
