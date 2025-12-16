local remove_old = Card.remove
function Card:remove()
    if self.added_to_deck or (self.area and (self.area == G.hand or self.area == G.deck)) then
        SMODS.calculate_context({
            cbean_destroyed = true,
            cbean_destroyed_card = self
        })
    end
    return remove_old(self)
end