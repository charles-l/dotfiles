xrandr --auto --output HDMI-0 --right-of DP-1
nvidia-settings --assign CurrentMetaMode=DP-1:1920x1080_60 +0+0 { ForceFullCompositionPipeline = On }, HDMI-0:1920x1080_60 +1920+0 { ForceFullCompositionPipeline = On }
sh ~/.fehbg
cwm
