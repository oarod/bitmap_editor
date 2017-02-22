require_relative '../app/bitmap_editor'
require_relative 'spec_helper';

describe BitmapEditor do
  before { subject.create_bitmap ['3', '5'] }

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

      expect(subject.bitmap).to eq expected
    end
  end

  describe :show_bitmap do
    it 'should output bitmap' do
      expected = "OOO\nOOO\nOOO\nOOO\nOOO\n"

      expect(STDOUT).to receive(:puts).with(expected)

      subject.show_bitmap
    end
  end

  describe :color_pixel do
    it 'should color pixel' do
      expected = [
        ['O', 'O', 'O'],
        ['P', 'O', 'O'],
        ['O', 'O', 'O'],
        ['O', 'O', 'O'],
        ['O', 'O', 'O']
      ]

      subject.color_pixel ['1', '2', 'P']

      expect(subject.bitmap).to eq expected
    end
  end

  describe :clear_bitmap do
    before { subject.color_pixel ['1', '1', 'P'] }

    it 'should clear bitmap' do
      expected = [
        ['O', 'O', 'O'],
        ['O', 'O', 'O'],
        ['O', 'O', 'O'],
        ['O', 'O', 'O'],
        ['O', 'O', 'O']
      ]

      subject.clear_bitmap

      expect(subject.bitmap).to eq expected
    end
  end

  describe :color_horizontal do
    it 'should draw a horizontal line of color' do
      expected = [
        ['O', 'O', 'O'],
        ['O', 'O', 'O'],
        ['O', 'O', 'O'],
        ['O', 'P', 'P'],
        ['O', 'O', 'O']
      ]

      subject.color_horizontal ['2', '3', '4', 'P']

      expect(subject.bitmap).to eq expected
    end
  end

  describe :color_vertical do
    it 'should draw a vertical line of color' do
      expected = [
        ['O', 'O', 'O'],
        ['O', 'O', 'O'],
        ['O', 'P', 'O'],
        ['O', 'P', 'O'],
        ['O', 'P', 'O']
      ]

      subject.color_vertical ['2', '3', '5', 'P']

      expect(subject.bitmap).to eq expected
    end
  end
end
