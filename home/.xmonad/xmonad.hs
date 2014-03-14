import Data.List(intercalate)
import System.IO

import XMonad
import XMonad.Actions.CycleWS
  ( nextScreen
  , prevScreen
  , shiftNextScreen
  , shiftPrevScreen
  )
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.LayoutModifier(ModifiedLayout)
import XMonad.Layout.Spacing
import XMonad.StackSet(view)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe, safeSpawn, unsafeSpawn)
import XMonad.Util.WorkspaceCompare(getSortByXineramaPhysicalRule)

main :: IO ()
main = do 
    xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
    safeSpawn "trayer" trayerArgs
    safeSpawn "xcompmgr" []
    safeSpawn "dropboxd" []
    safeSpawn "udisksvm" []
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ layout
        , logHook = xmoLoghook xmproc
        , modMask = mod4Mask
        , terminal = "urxvt"
        , borderWidth = 2
        , focusedBorderColor = "#606060"
        , normalBorderColor = "#101010"
        } `additionalKeys`
        [ ((mod4Mask, xK_Right), nextScreen) 
        , ((mod4Mask, xK_Left), prevScreen)
        , ((mod4Mask .|. shiftMask, xK_Right), shiftNextScreen)
        , ((mod4Mask .|. shiftMask, xK_Left), shiftPrevScreen)
        ]

layout :: ModifiedLayout Spacing Tall a
layout = spacing 3 $ Tall nmaster delta ratio 
  where
    nmaster = 1
    ratio = 1 / 2
    delta = 3 / 100

xmoLoghook :: Handle -> X ()
xmoLoghook h = dynamicLogWithPP $ xmobarPP
    { ppOutput = hPutStrLn h
    , ppTitle = xmobarColor "#8cd0d3" "" . shorten 50
    , ppLayout = const ""
    , ppVisible = xmobarColor "#dcdccc" "" . wrap "(" ")"
    , ppCurrent = xmobarColor "#f0dfaf" "" . wrap "[" "]"
    , ppSort = getSortByXineramaPhysicalRule 
    }

trayerArgs :: [String]
trayerArgs = 
    [ "--edge", "top"
    , "--align", "right"
    , "--widthtype", "pixel"
    , "--width", "50"
    , "--tint", "0x101010"
    , "--transparent", "true"
    , "--alpha", "50"
    , "--monitor", "1"
    , "--height", "25"
    , "--SetPartialStrut", "true"
    , "--padding", "2px"
    ]
