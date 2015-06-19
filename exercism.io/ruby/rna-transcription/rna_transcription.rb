class Complement

  def self.of_dna(dna_strand)
    raise ArgumentError if dna_strand.match(/[^CGTA]/)
    dna_strand.gsub(/(C|G|T|A)/, 'C' => 'G', 'G' => 'C', 'T' => 'A', 'A' => 'U')
  end

  def self.of_rna(rna_strand)
    raise ArgumentError if rna_strand.match(/[^CGUA]/)
    rna_strand.gsub(/(C|G|A|U)/, 'C' => 'G', 'G' => 'C', 'A' => 'T', 'U' => 'A')
  end
end

