
SMODS.Tag {
    key = 'colon_ceoreroll',
    atlas = 'colon_Tags',
    pos = { x = 0, y = 0 },
    discovered = false,
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "jamirror",
        code = "jamirror",
    },
    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.GREEN, function()
                G.from_boss_tag = true
                G.FUNCS.cbean_colonparen_reroll_ceo()

                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.CONTROLLER.locks[lock] = nil
                                return true
                            end
                        }))
                        return true
                    end
                }))

                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

  G.FUNCS.cbean_colonparen_reroll_ceo = function(e) 
    if not G.blind_select_opts then
        G.GAME.round_resets.boss_rerolled = true
        if not G.from_boss_tag then ease_dollars(-10) end
        G.from_boss_tag = nil
        G.GAME.round_resets.blind_choices.Boss = get_new_boss()
        G.GAME.round_resets.blind_choices.Teeny = Colonparen.get_new_blind('Teeny')
        G.GAME.round_resets.blind_choices.Small = Colonparen.get_new_blind('Small')
        G.GAME.round_resets.blind_choices.Big = Colonparen.get_new_blind('Big')
        G.GAME.round_resets.blind_choices.CEO = Colonparen.get_new_blind('CEO')
        for i = 1, #G.GAME.tags do
            if G.GAME.tags[i]:apply_to_run({type = 'new_blind_choice'}) then break end
        end
        return true
    end
    stop_use()
    G.GAME.round_resets.boss_rerolled = true
    if not G.from_boss_tag then ease_dollars(-10) end
    G.from_boss_tag = nil
    G.CONTROLLER.locks.boss_reroll = true
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
          play_sound('other1')
          G.blind_select_opts.ceo:set_role({xy_bond = 'Weak'})
          G.blind_select_opts.ceo.alignment.offset.y = 20
          return true
        end
      }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.3,
      func = (function()
        local par = G.blind_select_opts.ceo.parent
        G.GAME.round_resets.blind_choices.CEO = Colonparen.get_new_blind('CEO')

        G.blind_select_opts.ceo:remove()
        G.blind_select_opts.ceo = UIBox{
          T = {par.T.x, 0, 0, 0, },
          definition =
            {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
              UIBox_dyn_container({create_UIBox_blind_choice('CEO')},false,get_blind_main_colour('CEO'), mix_colours(G.C.BLACK, get_blind_main_colour('CEO'), 0.8))
            }},
          config = {align="bmi",
                    offset = {x=0,y=G.ROOM.T.y + 9},
                    major = par,
                    xy_bond = 'Weak'
                  }
        }
        par.config.object = G.blind_select_opts.ceo
        par.config.object:recalculate()
        G.blind_select_opts.ceo.parent = par
        G.blind_select_opts.ceo.alignment.offset.y = 0
        
        G.E_MANAGER:add_event(Event({blocking = false, trigger = 'after', delay = 0.5,func = function()
            G.CONTROLLER.locks.boss_reroll = nil
            return true
          end
        }))

        save_run()
        for i = 1, #G.GAME.tags do
          if G.GAME.tags[i]:apply_to_run({type = 'new_blind_choice'}) then break end
        end
        return true
      end)
    }))
  end



