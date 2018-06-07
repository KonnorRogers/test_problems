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
      word = cipher.caesar_cipher(input: 'hi', shift: 2)

      expect(word).to eq 'jk'
    end

    it 'shifts \'hi\' to \'jk\' with amount of 28' do
      word = cipher.caesar_cipher(input: 'hi', shift: 28)

      expect(word).to eq 'jk'
    end

    it 'shifts \'hi\' to \'jk\' with amount of 80' do
      word = cipher.caesar_cipher(input: 'hi', shift: 80)

      expect(word).to eq 'jk'
    end

    it 'shifts \'boo\' to \'dqq\' with shift of 28' do
      word = cipher.caesar_cipher(input: 'boo', shift: 28)

      expect(word).to eq 'dqq'
    end
  end
end