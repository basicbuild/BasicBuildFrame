QT += widgets

TEMPLATE = lib
DEFINES += SUBUIFRAME_LIBRARY

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

#######################通用配置#########################
# $$PWD .pro或.pri所在的路径
BUILD_DIR = $$PWD/../build
OUTPUT_DIR = $$PWD/../output

# @brief 配置预处理宏定义
DEFINES += CORE_LIBRARY

# @brief 配置临时文件和生成文件位置
win32:CONFIG(debug, debug|release){
    MOC_DIR = $$BUILD_DIR/debug/$$TARGET/build_moc
    UI_DIR = $$BUILD_DIR/debug/$$TARGET/build_uic
    RCC_DIR = $$BUILD_DIR/debug/$$TARGET/build_rcc
    OBJECTS_DIR = $$BUILD_DIR/debug/$$TARGET/build_obj
}
win32:CONFIG(release, debug|release){
    MOC_DIR = $$BUILD_DIR/release/$$TARGET/build_moc
    UI_DIR = $$BUILD_DIR/release/$$TARGET/build_uic
    RCC_DIR = $$BUILD_DIR/release/$$TARGET/build_rcc
    OBJECTS_DIR = $$BUILD_DIR/release/$$TARGET/build_obj
}

# @brief 配置目标文件生成位置
# DESTDIR 目标文件路径
win32:CONFIG(debug, debug|release){
    DESTDIR = $$OUTPUT_DIR/debug
}
win32:CONFIG(release, debug|release){
    DESTDIR = $$OUTPUT_DIR/release
}
#####################################################

SOURCES += \
    SubUIFrame.cpp

HEADERS += \
    SubUIFrame_global.h \
    SubUIFrame.h

# Default rules for deployment.
unix {
    target.path = /usr/lib
}
!isEmpty(target.path): INSTALLS += target
