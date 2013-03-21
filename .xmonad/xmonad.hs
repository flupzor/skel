import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Actions.PhysicalScreens
import XMonad.Util.EZConfig
import System.IO
import qualified Data.Map as M
import qualified XMonad.StackSet as W
 
main = do
  xmonad $ defaultConfig {
	modMask = mod4Mask,
	terminal = "gnome-terminal"
        } `additionalKeysP` myKeys

myKeys =
    [
    -- other additional keys
    ]
    ++
    [ (mask ++ "M-" ++ [key], screenWorkspace scr >>= flip whenJust (windows . action))
         | (key, scr)  <- zip "wer" [1,0,2] -- was [0..] *** change to match your screen order ***
         , (action, mask) <- [ (W.view, "") , (W.shift, "S-")]
    ]
