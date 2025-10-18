# Changelog

Report issues to [GitHub].

For Android Studio issues, go to https://b.android.com and file a bug using the
Android Studio component, not the NDK component.

If you're a build system maintainer that needs to use the tools in the NDK
directly, see the [build system maintainers guide].

[GitHub]: https://github.com/android/ndk/issues
[build system maintainers guide]:
  https://android.googlesource.com/platform/ndk/+/master/docs/BuildSystemMaintainers.md

## Announcements

## Changes

- Updated LLVM to clang-r563880c. See `clang_source_info.md` in the toolchain
  directory for version information.
  - [Issue 2144]: Fixed issue where `lldb.sh` did not work when installed to a
    path which contained spaces.
  - [Issue 2170]: Fixed issue where std::unique_ptr caused sizeof to be
    sometimes applied to function reference types.
- ndk-stack will now find symbols in files with matching build IDs even if the
  file names do not match.
- ndk-stack will now find symbols in files with matching build IDs even if the
  name of the file is not present in the trace.
- [Issue 2078]: ndk-stack now accepts a [native-debug-symbols.zip] file for the
  `--sym` argument as an alternative to a directory.
- [Issue 2109]: `llvm-lipo` has been removed. This tool is only useful for
  building macOS binaries but was mistakenly included in the NDK.
- [Issue 2135]: simpleperf no longer depends on Tk-Inter in non-GUI mode.
- [Issue 2146]: Fixed a case where invalid data would appear in simpleperf
  reports.

[Issue 2078]: https://github.com/android/ndk/issues/2078
[Issue 2109]: https://github.com/android/ndk/issues/2109
[Issue 2135]: https://github.com/android/ndk/issues/2135
[Issue 2142]: https://github.com/android/ndk/issues/2142
[Issue 2144]: https://github.com/android/ndk/issues/2144
[Issue 2146]: https://github.com/android/ndk/issues/2146
[Issue 2170]: https://github.com/android/ndk/issues/2170
[native-debug-symbols.zip]: https://support.google.com/googleplay/android-developer/answer/9848633?hl=en
