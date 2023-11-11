require "rainbow/ext/string"

class Convert
  def initialize(file)
    @file = ARGV[1] || "input.txt"
  end

  def get_unit(line)
    unit_regex = /[a-zA-Z] ((\(.*\))*[\d.]+\/[\d\.]+ (ct|oz|gr|kg|lb|lbs|ml|ltr))/
    md = line.match(unit_regex)
    return md[1] if md

    unit_regex = /\b (\d+.*) \$/
    md = line.match(unit_regex)
    return md[1] if md
  end

  def get_desc(line)
    md = line.match(/(.*)\$/)
    return line unless md
    desc = md[1].split(' ')[1..-1].join(' ') # remove first word
    unit = get_unit(line)
    if unit
      desc.sub(unit, '').strip
    else
      desc
    end
  end

  def get_price(line)
    price_regex = / (\$[\d\.]+) /
    md = line.match(price_regex)
    md[1] if md
  end

  def remove_surrounding_quotes(string)
    string.strip.gsub(/^"/, '').gsub(/"$/, '').strip
  end

  def run
    IO.readlines(@file).each do |line|
      line = remove_surrounding_quotes(line)
      parts = line.split(" ")
      # pp parts
      if parts[0] =~ /\w+-\d+/
        # puts "line: #{line.inspect}".color(:green)
        item_id = parts[0]
        # brand_desc = parts[1..-1].join(" ")
        brand_desc = get_desc(line)

        unit = get_unit(line)
        price = get_price(line)

        if parts[-1] =~ /Service/
          unit_upc = "Food Service"
        else
          unit_upc = parts[-1]
        end

        # puts "item_id: #{item_id} brand_desc: #{brand_desc} unit: #{unit} price: #{price} unit_upc: #{unit_upc}"
        puts "#{item_id},#{brand_desc},#{unit},#{price},#{unit_upc},#{line}"
        # puts "unit: #{unit}"
      end
    end
  end

end

if __FILE__ == $0
  Convert.new(ARGV[0]).run
end
