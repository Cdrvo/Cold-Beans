-- OI! PRETTY MUCH ALL OF THESE ARE UNFINISHED. DW ABOUT IT BECAUSE THE SECOND RUNAROUND EXISTS FOR A REASON - jamirror ( and the rest of Team :( )

Colonparen.GreekBlind{
    key = "colon_alpha",
    name = "Alpha",
    mult = 1,
    boss_colour = HEX("de6c6c"),
    pos = { x = 0, y = 0 },
    lower = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
            if context.mod_probability and context.trigger_obj and 
                context.trigger_obj.config and context.trigger_obj.config.center and SMODS.has_enhancement(context.trigger_obj, "m_lucky") then
                return {
                    numerator = context.numerator *3,
                    denominator = context.denominator 
                }
            end
        end
    },
    upper = {
        config = {
            lucky_trigger = 'lucky_mult',
        },
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
            if context.individual and context.cardarea == G.play and not context.end_of_round then
                local table = {'lucky_mult', 'lucky_money'}
                self.config.lucky_trigger = pseudorandom_element(table, pseudoseed('yma_alpha_blind'))
            end
            if context.mod_probability and context.trigger_obj and 
                context.trigger_obj.config and context.trigger_obj.config.center and SMODS.has_enhancement(context.trigger_obj, "m_lucky") then
                local trigger = context.identifier == self.config.lucky_trigger and context.denominator or 1
                return {
                    numerator = context.numerator * trigger,
                    denominator = context.denominator 
                }
            end
        end
    },
    beans_credits = {
        team = ":( / Yeah! Mostly Artists",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "RattlingSnow353",
    }
}