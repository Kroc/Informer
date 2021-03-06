# Inform6 for EPOC32 #

Write (and play!) Interactive Fiction ("text adventures") directly on your Psion 5 / 5mx and other EPOC32-based devices!

---

This is an updated build (v6.35-dev) of [Inform6] for [EPOC32] devices; I.e. [Psion 5 Series][Series5], 5 mx, 5 mx Pro, Revo, Series 7, netBook & netPad and other licenced devices including Geofox One, Osaris, Diamond Mako and Ericsson MC218.

The [IF Archive] has a [build of v6.21](http://www.ifarchive.org/indexes/if-archiveXinfocomXcompilersXinform6Xexecutables.html
) from 1999 produced by Simon Quinn, but this was not up to date enough to work with [PunyInform], a library for producing text-adventures compact enough to run on 8-bit hardware.

In this repo, I've done the absolutely bear minimum necessary to compile the unmodified Inform6 C code for EPOC32; all credit must go to Graham Nelson for the actual product.

[Inform6]: https://github.com/DavidKinder/Inform6
[EPOC32]: https://en.wikipedia.org/wiki/EPOC_(operating_system)
[Series5]: https://en.wikipedia.org/wiki/Psion_Series_5
[IF Archive]: http://www.ifarchive.org/
[PunyInform]: https://github.com/johanberntsson/PunyInform

## Installing ##

To run Inform6 on your device, first download a release. Unzip the file and transfer the files inside to your device (i.e. Compact Flash or using EPOC Connect).

### inst_te.exe — ER3 Installer Support ###

On most ER3 (Series 5) devices the in-built installer is not provided and you won't be able to open "*.sis" files. In this case open "inst_te.exe"; nothing appears to happen, but this adds the SIS un/install functionality to the device (see the Control Panel).

### stdlib.sis — C Standard Library ###

Inform6 requires the C Standard Library to be installed on the device; this is provided as "stdlib.sis".

Both "stdlib.sis" and "inst_te.exe" files are safe to delete after installation.

### editor/ — Plain Text Editor ###

Psion & EPOC32 devices do not come with a plain-text editor. Whilst you can import & export plain-text files from the native _Word_ application, this is hardly practical. For editing your Inform6 games on the device, installers for the "Symbian Text Editor Application" is provided in the "editor" folder.

### frotzs5/ — Frotz Z-Machine Interpreter ###

For _playing_ the games you write, and interactive fiction in general, an installer for "FrotzS5" is provided.

## Usage ##

*This isn't an app with a GUI*, it's a command-line executable! You will need a shell to be able to invoke "inform6.exe" with the desired parameters. EPOC32 doesn't come with a command-line shell, but one is provided in the download for you ("shell.exe").

When you open "shell.exe", you will need to navigate to the location of "inform6.exe" (and your story file) using the command-line. Type `D:`, for example, to switch to the "D" drive (CompactFlash slot). Use `ls` to list directory contents, and `cd` to change directories.

Compile your story file by invoking "inform6", e.g.:

```
inform6 mystory.inf
```

This will create "mystory.z5" in the same directory, which you can open with _FrotzS5_ to play.

Full command-line parameters for Inform6 are described in "usage.txt".

## Compiling Inform6 From Source ##

If you want to toy with the source code, you'll need to set up a period-accurate EPOC32 development environment; caveat emptor.

### Prerequisites: ###

You will need:

*   A Windows NT4, 2000 or Windows XP PC or Virtual Machine (e.g. [VirtualBox]), with 256 MB or more RAM.
Windows 2000 is recommended -- it's stable and there's no online-activation. Compiling on modern OSes is neither supported or even likely to work

* Microsoft Visual C++ v5 or v6 (recommended).  
  Only a minimal install is required. We will be using just `nmake` and the MSVC compiler

* The EPOC32 ER5 C++ SDK. Binaries produced will work on ER3/4 machines; the ER3 SDK is not supported. Apply the VC6 patch, provided in the SDK folder, if using Visual C++ 6

[VirtualBox]: https://www.virtualbox.org/


