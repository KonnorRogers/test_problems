require_relative '../caesar-cipher.rb'

RSpec.describe CaesarCipher do
  let(:cipher) { CaesarCipher.new }

  context '#initialize' do
    it 'initializes to a CaesarCipher class w/ no arguments' do
      expect(cipher).to be_an_instance_of CaesarCipher
    end
  end

  context '.caesar_cipher(input, shift_amount)' do
    it 'shifts \'hi\' to \'jk\' with amount of 2' do
      word = cipher.caesar_cipher('hi', 2)

      expect(word).to eq 'jk'
    end

    it 'shifts \'hi\' to \'jk\' with amount of 28' do
      word = cipher.caesar_cipher('hi', 28)

      expect(word).to eq 'jk'
    end

    it 'shifts \'hi\' to \'jk\' with amount of 56' do
      word = cipher.caesar_cipher('hi', 50)

      expect(word).to eq 'jk'
    end
  end
end