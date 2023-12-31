class DNA
  def initialize(sequence)
    @strand = sequence
  end

  def hamming_distance(other_strand)
    hamming_distance = 0
    shorter, longer = [@strand, other_strand].sort_by {|sequence| sequence.size}

    shorter.chars.each_with_index do |gene, idx|
      hamming_distance += 1 if gene != longer[idx]
    end
    hamming_distance
  end
end
