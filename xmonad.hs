import XMonad
import XMonad.Util.EZConfig(additionalKeys)
main = do
  xmonad $ defaultConfig 
    {
      terminal = "urxvt",
      modMask = mod4Mask,
      borderWidth = 3
    } `additionalKeys` -- make sure `cabal install xmonad-contrib` first
    [ ((mod4Mask .|. shiftMask, xK_l), spawn "xlock")
    , ((mod4Mask .|. shiftMask, xK_b), spawn "chromium")     
    ]
