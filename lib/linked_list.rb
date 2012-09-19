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

  def get(n)
    i = 0
    item = @first_item
    while i < n
      raise IndexError if item.nil?
      item = item.next_list_item
      i += 1
    end
    item.payload
  end

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
        output += item.payload
        if !item.last?
          output += ", "
        end
        item = item.next_list_item
      end
      output += " |"
    end
  end

  # ========= Bonus ========== #

  def [](payload)
  end

  def []=(n, payload)
  end

  def remove(n)
  end

end
