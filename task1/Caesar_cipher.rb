class Caesar_cipher
  attr_accessor :k

  def encryption(arg)
    @line = File.open(arg, 'r') {|file| file.read}.chars.map(&:ord)
    if @k.abs>1114111 then @k -= @k/1114111 * 1114111 end
    case
    when @k>0
      @line = @line.collect { |char| (char + @k.abs > 1114111 ? char + @k.abs - 1114111 : char + @k.abs).chr(Encoding::UTF_8) }.join
    when @k<0
      @line = @line.collect { |char| (char - @k.abs < 1 ? char - @k.abs + 1114111 : char - @k.abs).chr(Encoding::UTF_8) }.join
    end
    File.open('output.txt', 'w') { |file| file.write @line }
  end
end
