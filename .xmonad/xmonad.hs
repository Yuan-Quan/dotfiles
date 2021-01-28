--
-- ~/.xmonad/xmonad.hs
--

--------------IMPORTS----------------

-- Basic
import System.Posix.Env (getEnv)
import System.IO
import System.Directory
import Data.Maybe (maybe)
import Graphics.X11.ExtraTypes.XF86

-- XMonad
import XMonad

-- Config
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce

-- Layout
import XMonad.Layout.NoBorders
import XMonad.Layout.IM
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Grid
import XMonad.Layout.Tabbed
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))

-- Action
import XMonad.Actions.PhysicalScreens
import XMonad.Actions.CycleWS
import XMonad.Actions.NoBorders
import qualified XMonad.Actions.DynamicWorkspaceOrder as DO

-- Hook
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks

-- Util
import XMonad.Util.EZConfig
import XMonad.Util.Scratchpad
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.WorkspaceCompare
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig (additionalKeysP)

-- Stack
import qualified XMonad.StackSet as W

--------------------------------------------------------------

-- basic configuration

myModMask            = mod4Mask -- use the Windows key as mod
myBorderWidth        = 2        -- set window border size
myNormalBorderColor  = "#dddddd"  -- border color of normal windows
myFocusedBorderColor = "#FF69B4" -- border color of focused window
myTerminal           = "/usr/bin/alacritty" -- preferred terminal emulator

-- key bindings

myKeys :: [([Char], X ())]
myKeys =
  --xmonad
  [ ("M-C-r", spawn "xmonad --recompile") -- Recompiles xmonad]
  -- Layouts
  , ("M-S-<Space>", sendMessage ToggleStruts)     -- Toggles struts
  , ("M-S-n", withFocused toggleBorder)  -- Toggles noborder
  , ("M-S-f", do
                sendMessage ToggleStruts
                withFocused toggleBorder
    ) --Toggle struts and border,FULL SCREEN!!
  ] 

-- key bindings used only in stand alone mode (without KDE)
myStandAloneKeys :: [([Char], X ())]
myStandAloneKeys =
  [ ]

-- hooks for newly created windows
myManageHook :: ManageHook
myManageHook = manageDocks <+> manageScratchPad <+> coreManageHook

coreManageHook :: ManageHook
coreManageHook = composeAll . concat $
  [ [ className   =? c --> doFloat           | c <- myFloats]
  , [ className   =? c --> doFloat           | c <- kdeApps]
  , [ className   =? c --> doF (W.shift "2") | c <- webApps]
  , [ className   =? c --> doF (W.shift "8") | c <- torBrowser]
  , [ className   =? c --> doF (W.shift "9") | c <- mailIrcApps]
  , [ className   =? c --> doF (W.shift "4") | c <- steamApps]
  , [ className   =? c --> doF (W.shift "3") | c <- musicApps]
  ]
  where
    myFloats      = [
       "MPlayer"
     , "Gimp"
     , "Klipper"
     , "Keepassx"
     ]
    kdeApps       = [
       "yakuake"
     , "Plasma-desktop"
     , "plasmashell"
     ]
    webApps       = [
        "firefox"
      , "Firefox"
      , "google-chrome"
      , "Google-chrome"
     ]
    torBrowser    = [
        "Tor Browser"
     ]
    musicApps     = [
        "spotify"
      , "netease-cloud-music"
     ]
    steamApps     = [
        "Steam"
     ]
    mailIrcApps   = [
       "Thunderbird" , "konversation" ] -- yakuake style hook
manageScratchPad :: ManageHook
manageScratchPad = scratchpadManageHook (W.RationalRect l t w h)
  where
    h = 0.4     -- terminal height, 40%
    w = 1       -- terminal width, 100%
    t = 1 - h   -- distance from top edge, 90%
    l = 1 - w   -- distance from left edge, 0%

-- startup hooks

myStartupHook = do
     spawnOnce "/usr/bin/picom &"

-- layout hooks

myLayoutHook = (spacingRaw True (Border 0 6 6 6) True (Border 6 6 6 6) True) $
             avoidStruts $ coreLayoutHook

coreLayoutHook = tiled ||| Mirror tiled ||| Full ||| Grid
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   =  ResizableTall nmaster delta ratio []
    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio   = 1/2
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100

-- log hook (for xmobar)

myLogHook xmproc = dynamicLogWithPP xmobarPP
  { ppOutput = hPutStrLn xmproc
  , ppTitle  = xmobarColor "green" "" . shorten 50
  }

-- desktop :: DESKTOP_SESSION -> desktop_configuration

desktop "kde"           = kde4Config
desktop "kde-plasma"    = kde4Config
desktop "plasma"        = kde4Config
desktop _               = desktopConfig

----------------------- MAIN --------------------------------

main :: IO ()
main = do
  session <- getEnv "DESKTOP_SESSION"
  let defDesktopConfig = maybe desktopConfig desktop session
      myDesktopConfig = defDesktopConfig
        -- override
        { modMask     = myModMask
        , terminal = myTerminal
        , borderWidth = myBorderWidth
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , startupHook = myStartupHook
        , layoutHook  = myLayoutHook
        , manageHook  = myManageHook <+> manageHook defDesktopConfig
        } `additionalKeysP` myKeys --add my keybindings
  -- when running standalone (no KDE), try to spawn xmobar (if installed)
  xmobarInstalled <- doesFileExist "/usr/bin/xmobar"
  if session == Just "xmonad" && xmobarInstalled
    then do mproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar.hs"
            xmonad $ myDesktopConfig
              { logHook  = myLogHook mproc
              , terminal = myTerminal
              } `additionalKeysP` myStandAloneKeys
    else do xmonad myDesktopConfig
