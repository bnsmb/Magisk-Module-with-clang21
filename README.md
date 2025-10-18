# Magisk-Module-with-clang21

This Magisk module contains **clang21** and the files from the **Android NDK r29** necessary to compile libraries and binaries for **arm64** CPUs.
```
ASUS_I006D:/data/local/tmp $ clang --version
clang version 21.0.0git (https://android.googlesource.com/toolchain/llvm-project 37f38d1f3276b62fba09462ab4807dce846c732d)
Target: aarch64-unknown-linux-android
Thread model: posix
InstalledDir: /system/usr/clang21/bin
ASUS_I006D:/data/local/tmp $ 
```

The Module also contains some additional utilities in the directory **/system/usr/clang21/utils/bin**:

**make 4.4.1** 

**pkg-config 0.29** 

**pkgconf 2.30** 


**gnupatch 2.8** 

**gdb 16.3** 

**nano 8.6** 

**the GNU binutils version 2.44 (addr2line  ar  as  c++filt  elfedit  gprof  ld  ld.bfd  nm  objcopy  objdump  ranlib  readelf  size  strings  strip)** 

To create the ZIP file with the Magisk Module, clone or download the repository and execute the script
```
./create_zip.sh 
```
from the repository

----

After installing the Magisk Module, the **clang21** files are located in the directory 

**/system/usr/clang21**

The **clang21** binaries are in the directory

**/system/usr/clang21/bin**

The binaries for **make**, **pkg-config**, **pkgconf** and the other utilities are in the directory

**/system/usr/clang21/utils/bin**

The files from the Android NDK are in the directory

**/system/usr/ndk/r29**

The sysroot from the Android NDK is in the directory

**/system/usr/ndk/r29/toolchains/llvm/prebuilt/aarch64/sysroot/**


Use 
```
. /system/bin/init_clang21_env
```
to init the environment for the **clang21**. This scripts defines all necessary environment variables (including the PATH variable) to use the clang.

-----

The documentation for this Magisk Module is here:

[Documentation for the Magisk Module with clang21 and the NDK r29](http://bnsmb.de/Magisk_Modules.html#Documentation_for_the_Magisk_Module_with_clang21_and_the_NDK_r29)
	
----	

Source Code used to create the binaries
---------------------------------------

The repository with the source code for **clang** is:

[https://android.googlesource.com/toolchain/llvm-project](https://android.googlesource.com/toolchain/llvm-project)

The source code was checked out in **10/2025**

See the file 

**source/myconfigure** 

in the Magisk Module for the cmake options used to prepare the build process for the **clang21**.
The **clang21** binaries were compiled on a machine running the Linux OS with Cross Compiler from the **Android NDK r27b**.


The Android NDKs are available here:

[https://developer.android.com/ndk/downloads](https://developer.android.com/ndk/downloads)

The source code for the other tools in this Magisk Module is here:

| Tool |	Sourcecode 	|
| ---| ---|
| GNU binutiles |	https://www.gnu.org/software/binutils/ 	|
| gdb |	https://sourceware.org/gdb/ 	|
| make |	https://ftp.gnu.org/gnu/make/ 	|
| nano |	https://www.nano-editor.org/ 	|
| gnupatch |	https://savannah.gnu.org/projects/patch 	|
| pkg-config |	https://pkgconfig.freedesktop.org/releases/ 	|
| pkgconf |	https://github.com/pkgconf/pkgconf 	|




