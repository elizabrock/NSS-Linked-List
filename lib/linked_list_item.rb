class LinkedListItem
  include Comparable

  attr_reader :next_list_item
  attr_accessor :payload

  def initialize( payload )
    @payload = payload
  end

  def next_list_item= (linked_list_item)
    raise ArgumentError if linked_list_item === self
    @next_list_item = linked_list_item
  end

  def === other_item
    self.object_id == other_item.object_id
  end

  def last?
    @next_list_item.nil?
  end

  def <=> other
    # Precedence: integers, then strings, then symbols (each sorted
    # individually)
    if self.payload.class == other.payload.class
      return self.payload <=> other.payload
    end

    return 1 if self.payload.is_a? Symbol
    return -1 if self.payload.is_a? Integer

    # If I'm a string, use the fallback:
    -1 * (other <=> self)
  end
end
