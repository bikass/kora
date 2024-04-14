### Auto update the iconcache
### Do a manual update with following code in a terminal if you get errors
### Do check if you have used spaces in the naming of files or folders
### Sometimes you make a copy of an icon - this contains a space
### gtk-update-icon-cache -f iconthemefolder

### in some of the distributions you will a message popup if an icon theme has no cache
### if you have changed the icons - deleted folders etcetera then run this script

### intended to be used if you are making your own icon theme with icons mixed from
### icon themes.

gtk-update-icon-cache -f ../$(basename `pwd`)