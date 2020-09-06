make-sfx-package
================
Takes an executable and a directory full of files and packages them up into a
self-extracting archive. This archive will use the same icon and present the
same version information as the packaged executable contained within it.

When running the archive, the contents will be extracted to a temp directory
and the executable will be run.

It was developed to automatically package up small applications in an
easy-to-run way.

Instructions
------------
1. Acquire `ResourceHacker.exe` from http://www.angusj.com/resourcehacker/
   (get the zip version and extract the exe from it) and save it in `_sfxmeta`.
1. Copy the `_sfxmeta` folder into the directory you want to distribute.
2. Edit `_sfxmeta\conf.bat` and set the options.
3. Run `_sfxmeta\make_package.bat`.
4. Run the created `output.exe` to make sure everything works.

Notes
-----
- `ResourceHacker.exe` is not included in this repo as its licence prohibits
  redistribution.
- The `_sfxmeta` folder itself will be included in the archive (with the
  exception of `ResourceHacker.exe`) to make regenerating the executables easy.
- There is pretty much no error checking since I couldn't be bothered. There is
  a pause at the end of the main script. Use it to scroll up and check that
  everything worked as expected.

Licence
=======
- The included `7zSD.sfx` is from the [LZMA SDK](https://www.7-zip.org/sdk.html) which is public domain.
- All other code licensed under the [GNU GPLv3](https://www.gnu.org/licenses/gpl-3.0.html).