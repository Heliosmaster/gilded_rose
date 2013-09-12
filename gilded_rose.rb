def update_quality
  0.upto(Items.length-1) do |i|
    if (Items[i].name != "Aged Brie" && Items[i].name != "Backstage passes to a TAFKAL80ETC concert")
      if (Items[i].quality > 0)
        if (Items[i].name != "Sulfuras, Hand of Ragnaros")
          Items[i].quality = Items[i].quality - 1
        end
      end
    else
      if (Items[i].quality < 50)
        Items[i].quality = Items[i].quality + 1

        if (Items[i].name == "Backstage passes to a TAFKAL80ETC concert")
          if (Items[i].sell_in < 11)
            if (Items[i].quality < 50)
              Items[i].quality = Items[i].quality + 1
            end
          end

          if (Items[i].sell_in < 6)
            if (Items[i].quality < 50)
              Items[i].quality = Items[i].quality + 1
            end
          end
        end
      end
    end

    if (Items[i].name != "Sulfuras, Hand of Ragnaros")
      Items[i].sell_in = Items[i].sell_in - 1
    end

    if (Items[i].sell_in < 0)
      if (Items[i].name != "Aged Brie")
        if (Items[i].name != "Backstage passes to a TAFKAL80ETC concert")
          if (Items[i].quality > 0)
            if (Items[i].name != "Sulfuras, Hand of Ragnaros")
              Items[i].quality = Items[i].quality - 1
            end
          end
        else
          Items[i].quality = Items[i].quality - Items[i].quality
        end
      else
        if (Items[i].quality < 50)
          Items[i].quality = Items[i].quality + 1
        end
      end
    end
  end
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
