# implementation of removing non-integer
def remove_non_integer(str)
  str.chars.select { |char| char =~ /\d/ }.join
end

def get_isbn_number(isbn)
  # Remove any non-integer from the input string
  isbn = remove_non_integer(isbn)

  # Multiply each digit by 1 or 3 and sum the results
  sum = 0
  isbn.chars.each_with_index do |digit, index|
    factor = index.even? ? 1 : 3
    sum += digit.to_i * factor
  end

  # Take mod 10 of the summed number
  mod = sum % 10

  # Subtract 10 and check if the end number is 10 then make it 0
  checking_digits = (10 - mod) % 10

  # Append the check digit to the original ISBN
  isbn_number = "#{isbn}#{checking_digits}"

  return isbn_number
end

#  implementation of gets.chomp
def get_number
  print "Enter the number: "
  gets.chomp
end

# Take the user input
isbn = get_number

# Print ISBN Number
isbn_number = get_isbn_number(isbn)
puts "Complete ISBN: #{isbn_number}"
