SMODS.DrawStep {
    key = 'extra',
    order = 21,
    func = function(self, layer)
        if not self.cbean_extra and self.config.center.pos_extra then
            local atlas = G.ASSET_ATLAS[self.config.center.atlas_extra or self.config.center.atlas]
            self.cbean_extra = Sprite(0, 0, atlas.px, atlas.py,
                atlas, self.config.center.pos_extra)
        end
        if self.cbean_extra then
            if self.config.center.discovered or (self.params and self.params.bypass_discovery_center) then
                self.cbean_extra:set_sprite_pos(self.config.center.pos_extra)
                self.cbean_extra.role.draw_major = self
                if (self.edition and self.edition.negative and (not self.delay_edition or self.delay_edition.negative)) or (self.ability.name == 'Antimatter' and (self.config.center.discovered or self.bypass_discovery_center)) then
                    self.cbean_extra:draw_shader('negative', nil, self.ARGS.send_to_shader, nil, self.children.center)
                elseif not self:should_draw_base_shader() then
                elseif not self.greyed then
                    self.cbean_extra:draw_shader('dissolve', nil, nil, nil, self.children.center)
                end

                if self.ability.name == 'Invisible Joker' and (self.config.center.discovered or self.bypass_discovery_center) then
                    if self:should_draw_base_shader() then
                        self.cbean_extra:draw_shader('voucher', nil, self.ARGS.send_to_shader, nil, self.children.center)
                    end
                end

                local center = self.config.center
                if center.draw_extra and type(center.draw_extra) == 'function' then
                    center:draw_extra(self, layer)
                end

                local edition = self.delay_edition or self.edition
                if edition then
                    for k, v in pairs(G.P_CENTER_POOLS.Edition) do
                        if edition[v.key:sub(3)] and v.shader then
                            if type(v.draw) == 'function' then
                                v:draw(self, layer)
                            else
                                self.cbean_extra:draw_shader(v.shader, nil, self.ARGS.send_to_shader, nil, self.children.center)
                            end
                        end
                    end
                end
                if (edition and edition.negative) or (self.ability.name == 'Antimatter' and (self.config.center.discovered or self.bypass_discovery_center)) then
                    self.cbean_extra:draw_shader('negative_shine', nil, self.ARGS.send_to_shader, nil, self.children.center)
                end
            end
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}



local update_ref = Game.update
function Game:update(dt)
    if not (ColdBeansConfig and ColdBeansConfig["animations_disabled"]) then
        for k, v in pairs(G.P_CENTERS) do
            if not v.default_pos then v.default_pos = v.pos end
            if not v.default_pos_extra then v.default_pos_extra = v.pos_extra end
            handle_cbean_anim(v, dt)
            handle_cbean_anim_extra(v, dt)
        end
    else
        for k, v in pairs(G.P_CENTERS) do
            if not v.default_pos then v.default_pos = v.pos end
            if not v.default_pos_extra then v.default_pos_extra = v.pos_extra end
            v.pos = v.default_pos
            v.pos_extra = v.default_pos_extra
        end
    end
    return update_ref(self, dt)
end

function handle_cbean_anim(v, dt)
    if v.cbean_anim_states or v.cbean_anim then
        v.cbean_anim = format_cbean_anim(v.cbean_anim_states and v.cbean_anim_current_state and
            v.cbean_anim_states[v.cbean_anim_current_state] and v.cbean_anim_states[v.cbean_anim_current_state].anim or
            v.cbean_anim)
        if v.cbean_anim == nil then
            v.pos = v.default_pos
        else
            local loop = v.cbean_anim_states and v.cbean_anim_current_state and
                v.cbean_anim_states[v.cbean_anim_current_state] and
                v.cbean_anim_states[v.cbean_anim_current_state].loop
            if loop == nil then loop = true end
            if not v.cbean_anim_t then v.cbean_anim_t = 0 end
            if not v.cbean_anim.length then
                v.cbean_anim.length = 0
                for _, frame in ipairs(v.cbean_anim) do
                    v.cbean_anim.length = v.cbean_anim.length + (frame.t or 0)
                end
            end
            v.cbean_anim_t = v.cbean_anim_t + dt
            if not loop and v.cbean_anim_t >= v.cbean_anim.length then
                local continuation = v.cbean_anim_states[v.cbean_anim_current_state].continuation
                if continuation then
                    v.cbean_anim_current_state = continuation
                    v.cbean_anim_t = 0
                    handle_cbean_anim(v, dt)
                    return
                else
                    v.cbean_anim_t = v.cbean_anim.length
                end
            elseif loop then
                v.cbean_anim_t = v.cbean_anim_t % v.cbean_anim.length
            end
            local ix = 0
            local t_tally = 0
            for _, frame in ipairs(v.cbean_anim) do
                ix = ix + 1
                t_tally = t_tally + frame.t
                if t_tally > v.cbean_anim_t then break end
            end
            v.pos.x = v.cbean_anim[ix].x
            v.pos.y = v.cbean_anim[ix].y
        end
    end
end

function handle_cbean_anim_extra(v, dt)
    if v.cbean_anim_extra_states or v.cbean_anim_extra then
        v.cbean_anim_extra = format_cbean_anim(v.cbean_anim_extra_states and v.cbean_anim_extra_current_state and
            v.cbean_anim_extra_states[v.cbean_anim_extra_current_state] and
            v.cbean_anim_extra_states[v.cbean_anim_extra_current_state].anim or
            v.cbean_anim_extra)
        if v.cbean_anim_extra == nil then
            v.pos_extra = v.default_pos_extra
        else
            local loop = v.cbean_anim_extra_states and v.cbean_anim_extra_current_state and
                v.cbean_anim_extra_states[v.cbean_anim_extra_current_state] and
                v.cbean_anim_extra_states[v.cbean_anim_extra_current_state].loop
            if loop == nil then loop = true end
            if not v.cbean_anim_extra_t then v.cbean_anim_extra_t = 0 end
            if not v.cbean_anim_extra.length then
                v.cbean_anim_extra.length = 0
                for _, frame in ipairs(v.cbean_anim_extra) do
                    v.cbean_anim_extra.length = v.cbean_anim_extra.length + (frame.t or 0)
                end
            end
            v.cbean_anim_extra_t = v.cbean_anim_extra_t + dt
            if not loop and v.cbean_anim_extra_t >= v.cbean_anim_extra.length then
                local continuation = v.cbean_anim_extra_states[v.cbean_anim_extra_current_state].continuation
                if continuation then
                    v.cbean_anim_extra_current_state = continuation
                    v.cbean_anim_extra_t = 0
                    handle_cbean_anim_extra(v, dt)
                else
                    v.cbean_anim_extra_t = v.cbean_anim_extra.length
                end
            elseif loop then
                v.cbean_anim_extra_t = v.cbean_anim_extra_t % v.cbean_anim_extra.length
            end
            local ix = 0
            local t_tally = 0
            for _, frame in ipairs(v.cbean_anim_extra) do
                ix = ix + 1
                t_tally = t_tally + frame.t
                if t_tally > v.cbean_anim_extra_t then break end
            end
            if not v.pos_extra then v.pos_extra = {} end
            v.pos_extra.x = v.cbean_anim_extra[ix].x
            v.pos_extra.y = v.cbean_anim_extra[ix].y
        end
    end
end

function format_cbean_anim(anim)
    if not anim then return nil end
    local new_anim = {}
    for _, frame in ipairs(anim) do
        if frame and (frame.x or (frame.xrange and frame.xrange.first and frame.xrange.last)) and (frame.y or (frame.yrange and frame.yrange.first and frame.yrange.last)) then
            local firsty = frame.y or frame.yrange.first
            local lasty = frame.y or frame.yrange.last
            for y = firsty, lasty, firsty <= lasty and 1 or -1 do
                local firstx = frame.x or frame.xrange.first
                local lastx = frame.x or frame.xrange.last
                for x = firstx, lastx, firstx <= lastx and 1 or -1 do
                    new_anim[#new_anim + 1] = { x = x, y = y, t = frame.t or 0 }
                end
            end
        end
    end
    new_anim.t = anim.t
    return new_anim
end

function Card:cbean_set_anim_state(state)
    self.config.center.cbean_anim_current_state = state
    self.config.center.cbean_anim_t = 0
end

function Card:cbean_set_anim_extra_state(state)
    self.config.center.cbean_anim_extra_current_state = state
    self.config.center.cbean_anim_extra_t = 0
end

function SMODS.Center:cbean_set_anim_state(state)
    self.config.center.cbean_anim_current_state = state
    self.config.center.cbean_anim_t = 0
end

function SMODS.Center:cbean_set_anim_extra_state(state)
    self.cbean_anim_extra_current_state = state
    self.cbean_anim_extra_t = 0
end

function cbean_set_anim_state(center, state)
    center.config.center.cbean_anim_current_state = state
    center.config.center.cbean_anim_t = 0
end

function cbean_set_anim_extra_state(center, state)
    center.cbean_anim_extra_current_state = state
    center.cbean_anim_extra_t = 0
end
