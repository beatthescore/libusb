TARGET = usb
TEMPLATE = lib

SOURCES += io.c sync.c descriptor.c core.c

HEADERS += libusb.h version.h libusbi.h config.h

win32 {
    DEFINES += OS_WINDOWS
    DEFINES += "POLL_NFDS_TYPE='unsigned int'"
    SOURCES += os/threads_windows.c os/windows_usb.c os/poll_windows.c
    HEADERS += os/threads_windows.h os/windows_usb.h os/poll_windows.h
}

linux {
    DEFINES += OS_LINUX
    DEFINES += "HAVE_POLL_H=1"
    DEFINES += "POLL_NFDS_TYPE=nfds_t"
    DEFINES += "THREADS_POSIX=1"
    SOURCES += os/threads_posix.c os/linux_usbfs.c
    HEADERS += os/threads_posix.h os/linux_usbfs.h os/poll_posix.h
}

android {
    DEFINES += __ANDROID__
    SOURCES +=
    HEADERS +=
}
