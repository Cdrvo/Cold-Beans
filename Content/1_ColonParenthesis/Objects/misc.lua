local dontcompat = false;
function Colonparen.is_food(card)
	local food = {
		j_gros_michel = true,
		j_egg = true,
		j_ice_cream = true,
		j_cavendish = true,
		j_turtle_bean = true,
		j_diet_cola = true,
		j_popcorn = true,
		j_ramen = true,
		j_selzer = true,
	}
    dontcompat = true;
    if card.is_food and card:is_food() then
        dontcompat = false
        return true
    end
    dontcompat = false

	if food[card.config.center.key] or (card.config.center and card.config.center.pools and card.config.center.pools.Food) then
		return true
	end
    return false
end

if Card.is_food then
    local old_is_food = Card.is_food
    function Card:is_food(...)
        if not dontcompat then
            if Colonparen.is_food(self) then
                return true
            end
        end
        return old_is_food(self)
    end
end