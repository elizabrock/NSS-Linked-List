require 'linked_list_item'

class LinkedList
  attr_reader :first_item
  attr_reader :size

  def initialize *payloads
    @size = 0
    payloads.each do |payload|
      add_item( payload )
    end
  end

  def add_item(payload)
    @size += 1
    if @first_item.nil?
      @first_item = LinkedListItem.new(payload)
    else
      last_item = @first_item
      while !last_item.last?
        last_item = last_item.next_list_item
      end
      last_item.next_list_item = LinkedListItem.new(payload)
    end
  end

  def get_item(n)
    i = 0
    item = @first_item
    while i < n
      raise IndexError if item.nil?
      item = item.next_list_item
      i += 1
    end
    item
  end

  def get(n)
    get_item(n).payload
  end
  alias [] get

  def last
    if size == 0
      return nil
    end
    last_item = @first_item # last_item = nil
    until last_item.last?
      last_item = last_item.next_list_item
    end
    last_item.payload
  end

  def to_s
    if size == 0
      "| |"
    else
      output = "| "
      item = @first_item
      while item
        output += item.payload.to_s
        if !item.last?
          output += ", "
        end
        item = item.next_list_item
      end
      output += " |"
    end
  end

  # ========= Bonus ========== #
  def []=(n, payload)
    get_item(n).payload = payload
  end

 def remove(n)
    if n >= size
      raise IndexError, "cannot remove node at position #{n}, as it does not exist"
    end
    if n == 0
      @first_item = @first_item.next_list_item
    else
      before = get_item(n-1)
      node = get_item(n)
      before.next_list_item = node.next_list_item
    end
    @size -= 1
  end

  # ========= Index Exercise ========== #

  def index(payload)
    item = @first_item
    i = 0
    while item
      if item.payload == payload
        return i
      end
      item = item.next_list_item
      i += 1
    end
  end

  # ========= Sorting Exercise ========== #

  def sorted?
    item = @first_item
    return true unless item
    while item
      return true if item.last?
      return false if item > item.next_list_item
      item = item.next_list_item
    end
  end

  def sort!
    # bubble sort
    return unless @size > 1
    item = @first_item
    i = 0
    while item && !item.last?
      if item > item.next_list_item
        swap_with_next i
      end
      i +=1
      item = item.next_list_item
    end
    # # recursion, ftw
    sort! unless sorted?
  end

  def swap_with_next i
    item = get_item(i)
    next_item = get_item( i + 1)
    item.next_list_item = next_item.next_list_item
    next_item.next_list_item = item
    if i == 0
      @first_item = next_item
    else
      prev_item = get_item( i - 1)
      prev_item.next_list_item = next_item
    end
  end
end
