#
# Note: 
#
# This is only a collection of commands I used to cleanup the Android NDK r29 for usage on the phone
#
# Please check the commands in this script carefully before executing them!
#
# History
#  18.10.2025 /bs
#    initial release for Android NDK r29
#

if [[ $* == *-h* || $* == *--help* ]]  ;then
  echo "Usage: $0 [-x]"
  exit 1
fi 

if [ ! -d ./toolchains ] ; then
  echo "ERROR: This script must be executed in the top directory from an Android NDK"
  exit 10
fi 

[ ${TRACE}x != ""x ] && set -x

TARGET_DIR="$PWD"

echo "Preparing the Android NKD in the directory \"${TARGET_DIR}\" "
echo
if [[ $* != *-x* ]] ; then
  echo "Press return to continue"
  read x
fi



OLD_NDK_DIR="/data/develop/android/ModuleSrc/clang19/system/usr/ndk/r27b"

cd ./toolchains/llvm/prebuilt/linux-x86_64/lib

MISSING_LIBS=""

X86_LIBS="$( file * | grep "ELF 64-bit LSB shared object, x86-64" | cut -f1 -d":" )"

X86_LIB_LINKS=$( file * | grep "symbolic link to x86" | cut -f1 -d ":" )

X86_LOCAL_LIB_LINKS=$( cd x86_64-unknown-linux-gnu && file * | grep "symbolic link to l" | cut -f1 -d ":" )

if [ "${X86_LOCAL_LIB_LINKS}"x != ""x ] ; then
  ( cd x86_64-unknown-linux-gnu && tar -cf - ${X86_LOCAL_LIB_LINKS} ) | ( cd aarch64-unknown-linux-musl && tar -xf - )
fi

for CUR_LINK in ${X86_LIB_LINKS} ; do
  if [ -r ./aarch64-unknown-linux-musl/${CUR_LINK} ] ; then
    rm -f "${CUR_LINK}" &&  ln -s ./aarch64-unknown-linux-musl/${CUR_LINK} .
  else
    MISSING_LIBS="${MISSING_LIBS} ${CUR_LINK}"
  fi
done

rm -f ${X86_LIBS}

OTHER_X86_LIBS="$( file *.so* | grep "ELF 64-bit LSB shared object, x86-64" | cut -f1 -d ":" )"

OTHER_MISSING_LIBS=""
for CUR_LIB in ${OTHER_X86_LIBS} ;   do 
  if [ -r ${OLD_NDK_DIR}/lib/${CUR_LIB} ] ; then
    cp ${OLD_NDK_DIR}/lib/${CUR_LIB} . 
  else
    OTHER_MISSING_LIBS="${OTHER_MISSING_LIBS} ${CUR_LIB}"
    rm "${CUR_LIB}"
  fi
done
[ ! -L libxml2.so ] && ln -s ./libxml2.so.2 libxml2.so

rm -rf arm-unknown-linux-musleabihf
rm -rf i386-unknown-linux-gnu
rm -rf i686-unknown-linux-musl
rm -rf i686-w64-windows-gnu
rm -rf  x86_64-unknown-linux-gnu
rm -rf x86_64-unknown-linux-musl
rm -rf x86_64-w64-windows-gnu
rm -rf python-packages

rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/musl/lib/arm-unknown-linux-musleabihf  
rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/musl/lib/i686-unknown-linux-musl  
rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/musl/lib/libclang.so  
rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/musl/lib/libc_musl.so  
rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/musl/lib/x86_64-unknown-linux-musl

rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/python3/
rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/share/

rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/lib/arm-linux-androideabi  
rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/lib/i686-linux-android  
rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/lib/riscv64-linux-android  
rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/lib/x86_64-linux-android

rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/lib/clang/21/lib/linux/arm
rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/lib/clang/21/lib/linux/i386
rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/lib/clang/21/lib/linux/riscv64
rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/lib/clang/21/lib/linux/x86_64

rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/lib/clang/21/lib/linux/*-arm-*
rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/lib/clang/21/lib/linux/*-i686-*
rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/lib/clang/21/lib/linux/*-x86_64-*
rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/lib/clang/21/lib/linux/*-riscv64-*

rm -rf ${TARGET_DIR}/build
rm -rf ${TARGET_DIR}/prebuilt
rm -rf ${TARGET_DIR}/sources
rm -rf ${TARGET_DIR}/simpleperf
rm -rf ${TARGET_DIR}/wrap.sh

rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/bin
rm -rf ${TARGET_DIR}/python-packages
rm -rf ${TARGET_DIR}/shader-tools
rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/lib/python3
rm -rf ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/lib/python3.11

rm -rf ./ndk-lldb ./ndk-gdb ./ndk-stack ./ndk-which ./ndk-build

ln -s ./linux-x86_64 ${TARGET_DIR}/toolchains/llvm/prebuilt/aarch64

cd ${TARGET_DIR}/toolchains/llvm/prebuilt/linux-x86_64/lib/clang/21/lib/linux/
for i in * ; do ln -s ./$i ${i/-aarch64-android/}; done

rm ./toolchains/llvm/prebuilt/linux-x86_64/lib/clang/21/lib/linux/aarch64/aarch64


