
class Repository
    def initialize
        @last_id = 0
        @items = []
    end
    
    def add(item)
        @last_id = @last_id + 1
        item.id = @last_id
        @items.push(item)
    end
    
    def get_items()
        @items
    end
end