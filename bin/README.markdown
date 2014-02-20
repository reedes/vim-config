

Inspired by Derek Wyatt’s video on coding Scala using Vim. In the video he
emphasized using a single Vim instance.

For those of us who have been frustrated by multiple graphical windows
open, the client/server capability.

Supports Mac OS X at present.

Any help in porting to other platforms (Linux, Windows, etc.) will be
welcomed. Please fork and offer pulls of tested ports. 

Not for use by those who have multiple windows or terminals open.

```
 ":help view" for startup modes
 view     vim -R     Start in read-only mode (see |-R|).       *view*
 gvim     vim -g     Start the GUI (see |gui|).          *gvim*
 gex      vim -eg    Start the GUI in Ex mode.       *gex*
 gview    vim -Rg    Start the GUI in read-only mode.      *gview*
 rvim     vim -Z     Like "vim", but in restricted mode (see |-Z|)   *rvim*
 rview    vim -RZ    Like "view", but in restricted mode.    *rview*
 rgvim    vim -gZ    Like "gvim", but in restricted mode.    *rgvim*
 rgview   vim -RgZ   Like "gview", but in restricted mode.   *rgview*
 evim     vim -y     Easy Vim: set 'insertmode' (see |-y|)     *evim*
 eview    vim -yR    Like "evim" in read-only mode     *eview*
 vimdiff  vim -d     Start in diff mode |diff-mode|
 gvimdiff vim -gd    Start in diff mode |diff-mode|
```

## Installation

Copy (or symlink) the file to somewhere in your path.

## Configuration

You can control the placement of windows on splits:

```
set splitbelow
set splitright
```
