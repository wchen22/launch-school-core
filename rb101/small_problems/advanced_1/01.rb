text = File.read('01.yml')

puts text

adjectives = %w(quick lazy sleepy ugly despondent seductive)
nouns = %w(fox dog forklift whale)
verbs = %w(jumps lifts preaches bites licks gamboled)
adverbs = %w(easily lazily noisily excitedly frantically)

new_text = text.split.map do |word|
  word.gsub!('%{adjective}', adjectives.sample)
  word.gsub!('%{noun}', nouns.sample)
  word.gsub!('%{verb}', verbs.sample)
  word.gsub!('%{adverb}', adverbs.sample)
  word

  # case 
  # when word.start_with?('%{adjective}') then adjectives.sample
  # when word.start_with?('%{noun}') then nouns.sample
  # when word.start_with?('%{verb}') then verbs.sample
  # when word.start_with?('%{adverb}') then adverbs.sample
  # else word
  # end
end

puts new_text.join(' ')

#LS solution - however if a line contains more than one of a type it'll use the sampled word type for all instances
ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

File.open('01.yml') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end

#Peer solution that was more intuitive for me - however if a line contains more than one of a type it'll use the sampled word type for all instances
text = File.read('01.yml')

lines = text.split("\n")

possible_words = {
  '%{noun}' => ['fox', 'dog', 'head', 'leg'],
  '%{verb}' => ['jumps', 'lifts', 'bites', 'licks'],
  '%{adverb}' => ['easily', 'lazily', 'noisily', 'excitedly'],
  '%{adjective}' => ['quick', 'lazy', 'sleepy', 'ugly']
}

possible_words.each do |key, value|
  lines.each do |line|
    line.gsub!(key, value.sample)
  end
end

print lines.join("\n")