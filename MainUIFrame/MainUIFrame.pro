QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17
DEBUG_NAME = MainUIFramed
RELEASE_NAME = MainUIFrame

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

#######################通用配置#########################
# $$PWD .pro或.pri所在的路径
BUILD_DIR = $$PWD/../build                      # 临时文件生成的根目录
OUTPUT_DIR = $$PWD/../output               # 目标文件生成的根目录

# @brief 配置临时文件和生成文件位置
win32:CONFIG(debug, debug|release){
    MOC_DIR = $$BUILD_DIR/debug/$$TARGET/build_moc         #指定moc命令将含Q_OBJECT的头文件转换成标准.h文件的存放目录
    UI_DIR = $$BUILD_DIR/debug/$$TARGET/build_uic               #指定rcc命令将.qrc文件转换成qrc_*.h文件的存放目录
    RCC_DIR = $$BUILD_DIR/debug/$$TARGET/build_rcc           #指定rcc命令将.qrc文件转换成qrc_*.h文件的存放目录
    OBJECTS_DIR = $$BUILD_DIR/debug/$$TARGET/build_obj   #指定目标文件(obj)的存放目录
}
win32:CONFIG(release, debug|release){
    MOC_DIR = $$BUILD_DIR/release/$$TARGET/build_moc
    UI_DIR = $$BUILD_DIR/release/$$TARGET/build_uic
    RCC_DIR = $$BUILD_DIR/release/$$TARGET/build_rcc
    OBJECTS_DIR = $$BUILD_DIR/release/$$TARGET/build_obj
}

# @brief 配置目标文件生成位置
win32:CONFIG(debug, debug|release){
    # DESTDIR 目标文件路径
    DESTDIR = $$OUTPUT_DIR/debug
}
win32:CONFIG(release, debug|release){
    DESTDIR = $$OUTPUT_DIR/release
}

# @brief 指定生成的应用程序名
win32:CONFIG(debug, debug|release){
    TARGET  = $$DEBUG_NAME
}
win32:CONFIG(release, debug|release){
    TARGET  = $$RELEASE_NAME
}

#######################个性配置#########################
# @brief 库的引用
win32:CONFIG(debug, debug|release){
    LIBS += -L$$OUTPUT_DIR/debug/ -lCored
    LIBS += -L$$OUTPUT_DIR/debug/ -lSubUIFramed
}
win32:CONFIG(release, debug|release){
    LIBS += -L$$OUTPUT_DIR/release/ -lCore  
    LIBS += -L$$OUTPUT_DIR/release/ -lSubUIFrame
}

# @brief 包含路径
INCLUDEPATH += $$PWD/../Core \
                            $$PWD/../SubUIFrame
# @brief 依赖路径
DEPENDPATH += $$PWD/../Core \   # DEPENDPATH 是指定那些文件在修改后需要重新运行 qmake 的路径
                           $$PWD/../SubUIFrame

#####################################################

SOURCES += \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    mainwindow.h


# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


