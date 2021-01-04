
:: https://curl.se/windows/dl-7.74.0_2/curl-7.74.0_2-win32-mingw.zip

set workspace=%cd%\.workspace
set download=%workspace%\download

if not exist %workspace% (
	busybox.exe mkdir -p %download%
	busybox.exe mkdir -p %workspace%\make
)

if not exist %workspace%\busybox.exe (
	curl -o %workspace%\busybox.exe "https://frippery.org/files/busybox/busybox.exe"
)

set mirror=https://mirrors.tuna.tsinghua.edu.cn/cygwin/x86_64/release

curl -o %download%\make.tar.xz %mirror%/make/make-4.3-1.tar.xz
curl -o %download%\make-deps.tar.xz %mirror%/makedepend/makedepend-1.0.6-1.tar.xz

busybox.exe tar -xJf %download%\make.tar.xz -C %workspace%\make
busybox.exe tar -xJf %download%\make-deps.tar.xz -C %workspace%\make
