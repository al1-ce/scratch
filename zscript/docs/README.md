# ZScript Discovery

Various tests and "utils" I do with gzdoom's zscript

## Structure (mostly for my reference)

- docs/ - Documentation (readme, license, authors)
- flats/ - Wall/floor textures
- graphics/ - Menu graphics
- maps/ - Map wads
- sprites/ - Player sprites
- src/ - ZScript code (this is where I step in)
- textures/ - More wall/floor textures?
- colormap.lmp - LUT (should remove?)
- dbigfont.lmp - Font
- defbinds.lmp - Default keymap
- defcvars.lmp - Console variables
- iwadinfo.lmp - Info about mod
- justfile - File to make "building" and running mod easy with my nvim plugin
- language.lmp - Translation unit
- mapinfo.lmp - Map, skill, intermission info
- menudef.lmp - Menu info
- playpal.lmp - Palette
- zscript.zs - ZScript entrance point

Seems that almost all of directories are arbitrary, gotta think about it

