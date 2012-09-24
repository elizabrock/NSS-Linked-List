class LinkedListItem
  include Comparable

  attr_reader :next_list_item
  attr_accessor :payload

  def initialize( payload )
    @payload = payload
  end

  def next_list_item= (linked_list_item)
    raise ArgumentError if linked_list_item.object_id == self.object_id
    @next_list_item = linked_list_item
  end

  def last?
    @next_list_item.nil?
    # or:
    # !@next_list_item
    # or:
    # @next_list_item ? false : true
    # or:
    # if @next_list_item
    #   false
    # else
    #   true
    # end
  end

  def <=> other
    if self.payload.is_a? Symbol and !other.payload.is_a? Symbol
      1
    elsif self.payload.is_a? Integer and !other.payload.is_a? Integer
      -1
    elsif !other.payload.is_a? String and self.payload.class != other.payload.class
      -1 * (other <=> self)
    else
      self.payload <=> other.payload
    end
  end
end
