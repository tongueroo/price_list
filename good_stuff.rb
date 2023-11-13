class Convert
  def initialize(file)
    @file = ARGV[1] || "good_stuff.txt"
  end

  def run
    IO.readlines(@file).each do |line|
      line = remove_surrounding_quotes(line)
      puts line
    end
  end

  def remove_surrounding_quotes(string)
    string.strip.gsub(/^"/, '').gsub(/"$/, '').strip
  end
end

if __FILE__ == $0
  Convert.new(ARGV[0]).run
end
