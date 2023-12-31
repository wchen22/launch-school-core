# The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.

encrypted_names = 
"Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu".split("\n")

def decrypt(name)
  letters = ('a'..'z').to_a

  name.chars.map {|char|
    if letters.include? char.downcase
      index = letters.index(char.downcase)
      new_index = (index + 13) % 26
      char.downcase == char ? letters[new_index] : letters[new_index].upcase
    else
      char
    end
  }.join
end

encrypted_names.each {|name| p decrypt(name)}

