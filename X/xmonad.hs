-- make sure xmonad-contrib is installed

import XMonad
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.DynamicLog
-- for full-screen ability of some gtk apps
import XMonad.Hooks.EwmhDesktops
-- for scratchpad
import XMonad.Util.Scratchpad
import XMonad.StackSet

main = do
    xmonad $ ewmh defaultConfig
        { terminal = "urxvtc"
        , modMask = mod4Mask
        , manageHook = myManageHook <+> myScratchpadHook
        , borderWidth = 1
        , normalBorderColor = "navy"
        , focusedBorderColor = "gray"
        , handleEventHook = handleEventHook defaultConfig <+> fullscreenEventHook
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_l), spawn "xlock")
        , ((mod4Mask .|. shiftMask, xK_b), spawn "chromium")
        , ((mod4Mask .|. shiftMask, xK_s), spawn "pavucontrol")
        , ((mod4Mask , xK_s), scratchpadSpawnActionTerminal "urxvtc")
        ]

myManageHook = composeAll
    [ className =? "Pavucontrol" --> doFloat
    ]

-- scratchpad settings
myScratchpadHook = scratchpadManageHook $ RationalRect 0.2 0.2 0.6 0.6
