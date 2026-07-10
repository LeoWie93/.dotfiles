# Ref https://wiki.hypr.land/Configuring/Workspace-Rules/

hl.window_rule({
    name            = "slack",
    match           = { class = "slack" },

    no_screen_share = true
})

hl.window_rule({
    name            = "keepassxc",
    match           = { class = "KeePassXC" },

    no_screen_share = true,
    size            = { 800, 600 },
    center          = true,
    float           = true
})

hl.window_rule({
    name   = "blueman-manager",
    match  = { class = "blueman-manager" },

    size   = { 800, 600 },
    center = true,
    float  = true
})

hl.window_rule({
    name   = "pavucontrol",
    match  = { class = "org.pulseaudio.pavucontrol" },

    size   = { 800, 600 },
    center = true,
    float  = true
})

hl.window_rule({
    name   = "nm-connection-editor",
    match  = { class = "nm-connection-editor" },

    size   = { 800, 600 },
    center = true,
    float  = true
})

hl.window_rule({
    name   = "hyprland-share-picker",
    match  = { class = "hyprland-share-picker" },

    size   = { 800, 600 },
    center = true,
    float  = true
})

hl.window_rule({
    name     = "fix tooltips",
    match    = { class = "^(.*jetbrains.*)$", title = "^(win.*)$" },

    no_focus = true,
})

hl.window_rule({
    name     = "fix tab dragging",
    match    = { class = "^(.*jetbrains.*)$", title = "^\\s$" },

    no_focus = true,
})

--# fix tooltips (always have a title of `win.<id>`)
--windowrule = no_initial_focus on, match:class ^(.*jetbrains.*)$, match:title ^(win.*)$
--windowrule = no_focus on, match:class ^(.*jetbrains.*)$, match:title ^(win.*)$
--# fix tab dragging (always have a single space character as their title)
--windowrule = no_initial_focus on, match:class ^(.*jetbrains.*)$, match:title ^\\s$
--windowrule = no_focus on, match:class ^(.*jetbrains.*)$, match:title ^\\s$

local dialog_patterns = {
    "^(Open File)(.*)$",
    "^(Select a File)(.*)$",
    "^(Choose wallpaper)(.*)$",
    "^(Open Folder)(.*)$",
    "^(Save As)(.*)$",
    "^(Library)(.*)$",
    "^(File Upload)(.*)$",
    "^(.*)(wants to save)$",
    "^(.*)(wants to open)$"
}

for _, pattern in ipairs(dialog_patterns) do
    hl.window_rule({
        name   = "Dialog: " .. pattern,
        match  = { title = pattern },
        center = true,
        float  = true,
    })
end
