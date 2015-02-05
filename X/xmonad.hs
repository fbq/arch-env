-- make sure xmonad-contrib is installed

import XMonad
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
main = do
    xmonad $ ewmh defaultConfig
        { terminal = "urxvtc"
        , modMask = mod4Mask
        , manageHook = myManageHook
        , borderWidth = 1
        , normalBorderColor = "navy"
        , focusedBorderColor = "gray"
        , handleEventHook = handleEventHook defaultConfig <+> fullscreenEventHook
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_l), spawn "xlock")
        , ((mod4Mask .|. shiftMask, xK_b), spawn "chromium")
        , ((mod4Mask .|. shiftMask, xK_s), spawn "pavucontrol")
        ]

myManageHook = composeAll
    [ className =? "Pavucontrol" --> doFloat
    ]
