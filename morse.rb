M_CODES = {
  '.-' => 'A',
  '-...' => 'B',
  '-.-.' => 'C',
  '-..' => 'D',
  '.' => 'E',
  '..-.' => 'F',
  '--.' => 'G',
  '....' => 'H',
  '..' => 'I',
  '.---' => 'J',
  '-.-' => 'K',
  '.-..' => 'L',
  '--' => 'M',
  '-.' => 'N',
  '---' => 'O',
  '.--.' => 'P',
  '--.-' => 'Q',
  '.-.' => 'R',
  '...' => 'S',
  '-' => 'T',
  '..-' => 'U',
  '...-' => 'V',
  '.--' => 'W',
  '-..-' => 'X',
  '-.--' => 'Y',
  '--..' => 'Z'
}.freeze

$morse = false

def char_splitter(words)
  converted = []
  i = 0
  words.map do |w|
    chars = w.split
    test = []
    chars.each do |c|
      M_CODES.each do |key, value|
        if c == key
          test.push(value)
          $morse = false
        elsif c == value
          test.push(key)
          $morse = true
        end
      end
    end
    test = test.join if $morse == false
    test = test.join(' ') if $morse == true
    converted[i] = test
    i += 1
  end
  converted = converted.join(' ') if $morse == false
  converted = converted.join('   ') if $morse == true

  converted
end

def word_splitter(sentence)
  words = sentence.split('   ')
  res = char_splitter(words)
  puts(res)
end

word_splitter('.-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...')
word_splitter('A   B O X   F U L L   O F   R U B I E S')
