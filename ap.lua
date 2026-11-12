
function G.FUNCS.escapism_back(from_game_over) 
    if G.ESC_JUST_WON then 
        G.FUNCS.overlay_menu{
            definition = create_UIBox_win(),
            config = {no_esc = true}
        }
        return true
    end
    G.FUNCS.overlay_menu{
        definition = create_UIBox_game_over(),
        config = {no_esc = true}
    }
end


local wingamehook = win_game
function win_game(...)
    G.ESC_JUST_WON = true
    return wingamehook(...)
end

local exit_overlay_menu_ef = G.FUNCS.exit_overlay_menu
function G.FUNCS.exit_overlay_menu(...)
    G.ESC_JUST_WON = nil
    return exit_overlay_menu_ef(...)
end
local prepstageh = Game.prep_stage
function Game:prep_stage(...)
    G.ESC_JUST_WON = nil
    return prepstageh(self, ...)
end