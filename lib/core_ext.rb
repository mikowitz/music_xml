class Symbol
  def dashify
    to_s.gsub(/_/, "-")
  end

  def major
    [self, :major]
  end

  def minor
    [self, :minor]
  end

  def sharp
    :"#{self}#" 
  end

  def flat
    :"#{self}b"
  end
end
