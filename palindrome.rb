def largestPalindromeProduct(n)
  n1 = 10**n - 1
  n2 = n1
  products = []

  def all_products(n, n1, n2, products)
    return if n1 < 10**(n-1) || n2 < 10**(n-1)
    prod = n1 * n2
    #puts "#{prod} = #{n1} * #{n2}"
    products.include?(prod) ? return : products << prod

    all_products(n, n1 -= 1, n2, products)
    all_products(n, n1, n2 -= 1, products)
  end

  all_products(n, n1, n2, products)

  # Select the largest palindrome from the products
  palindrome = products.select { |p| p.to_s == p.to_s.reverse }.max
end

puts largestPalindromeProduct(2) #should return 9009.

puts largestPalindromeProduct(3) #should return 906609.
