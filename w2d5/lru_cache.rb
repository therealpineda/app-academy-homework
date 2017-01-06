class LRUCache
  attr_reader :cache, :limit

  def initialize(limit)
    @cache = Hash.new
    @limit = limit
  end

  def count
  # returns number of elements currently in cache
    cache.count
  end

  def add(el)
  # adds element to cache according to LRU principle
    clear_old(el)
    make_room
    cache[el] = Time.now
  end

  def show
  # shows the items in the cache, with the LRU item first
    p cache.inject([]) { |items, (item, _) | items << item }
  end

  private
  # helper methods go here!

  def clear_old(el)
    cache.delete(el) if cache.include?(el)
  end

  def make_room
    cache.delete(cache.first[0]) if cache.count == limit
  end

end

#
# We will assume our input is limited to Fixnums, Strings, Arrays, Symbols, and Hashes. We will allow the user to set the size of the cache.
#
# Ultimately, our LRU Cache should function as follows:

  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2


  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})

  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
