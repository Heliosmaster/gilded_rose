require "awesome_print"

def update_item(item)
  if (item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert")
    if (item.quality > 0)
      if (item.name != "Sulfuras, Hand of Ragnaros")
        decrease_quality(item)
      end
    end
  else
    increase_quality(item)
    if (item.name == "Backstage passes to a TAFKAL80ETC concert")
      case
      when item.sell_in <=10 && item.sell_in > 5
        increase_quality(item)
      when item.sell_in <= 5
        increase_quality(item)
        increase_quality(item)
      end
    end
  end

  if (item.name != "Sulfuras, Hand of Ragnaros")
    item.sell_in = item.sell_in - 1
  end

  if (item.sell_in < 0)
    if (item.name != "Aged Brie")
      if (item.name != "Backstage passes to a TAFKAL80ETC concert")
        if (item.quality > 0)
          if (item.name != "Sulfuras, Hand of Ragnaros")
            decrease_quality(item)
          end
        end
      else
        item.quality = 0 
      end
    else
      increase_quality(item)
    end
  end
end

def update_quality
  0.upto(Items.length-1) do |i|
    update_item(Items[i])
  end
end

def increase_quality(item)
  item.quality +=1 if item.quality < 50
end

def decrease_quality(item)
  item.quality -= 1
end
# The code below belongs to the goblin in the corner
# do not change, or he will insta-rage and one-shot you

Item = Struct.new :name, :sell_in, :quality

Items = [
  Item.new("+5 Dexterity Vest", 10, 20),
  Item.new("Aged Brie", 2, 0),
  Item.new("Elixir of the Mongoose", 5, 7),
  Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
  Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
  Item.new("Conjured Mana Cake", 3, 6)
]

##############################################
100.times { update_quality }
ap Items
