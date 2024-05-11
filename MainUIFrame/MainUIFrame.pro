QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17
TARGET   = MainUIFrame # @brief ָ�����ɵ�Ӧ�ó�������ͼ��
#RC_ICONS = MainUIFrame.ico

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# $$PWD .pro��.pri���ڵ�·��

# @brief ��������
BUILD_DIR = $$PWD/../build                      # ��ʱ�ļ����ɵĸ�Ŀ¼
OUTPUT_DIR = $$PWD/../output               # Ŀ���ļ����ɵĸ�Ŀ¼
PRO_NAME = $$basename(_PRO_FILE_)

message("Build directory: " $$BUILD_DIR)
message("Output directory: " $$OUTPUT_DIR)

# @brief ������ʱ�ļ��������ļ�λ��
win32:CONFIG(debug, debug|release){
    MOC_DIR = $$BUILD_DIR/debug/$$TARGET/build_moc         #ָ��moc�����Q_OBJECT��ͷ�ļ�ת���ɱ�׼.h�ļ��Ĵ��Ŀ¼
    UI_DIR = $$BUILD_DIR/debug/$$TARGET/build_uic               #ָ��rcc���.qrc�ļ�ת����qrc_*.h�ļ��Ĵ��Ŀ¼
    RCC_DIR = $$BUILD_DIR/debug/$$TARGET/build_rcc           #ָ��rcc���.qrc�ļ�ת����qrc_*.h�ļ��Ĵ��Ŀ¼
    OBJECTS_DIR = $$BUILD_DIR/debug/$$TARGET/build_obj   #ָ��Ŀ���ļ�(obj)�Ĵ��Ŀ¼
}
win32:CONFIG(release, debug|release){
    MOC_DIR = $$BUILD_DIR/release/$$TARGET/build_moc
    UI_DIR = $$BUILD_DIR/release/$$TARGET/build_uic
    RCC_DIR = $$BUILD_DIR/release/$$TARGET/build_rcc
    OBJECTS_DIR = $$BUILD_DIR/release/$$TARGET/build_obj
}

# @brief ����Ŀ���ļ�����λ��
win32:CONFIG(debug, debug|release){
    # DESTDIR Ŀ���ļ�·��
    DESTDIR = $$OUTPUT_DIR/debug
}
win32:CONFIG(release, debug|release){
    DESTDIR = $$OUTPUT_DIR/release
}

# @brief �������
win32:CONFIG(debug, debug|release){
    LIBS += -L$$OUTPUT_DIR/debug/ -lCored
    LIBS += -L$$OUTPUT_DIR/debug/ -lSubUIFramed
}
win32:CONFIG(release, debug|release){
    LIBS += -L$$OUTPUT_DIR/release/ -lCore  
    LIBS += -L$$OUTPUT_DIR/release/ -lSubUIFrame
}

# @brief ����·��
INCLUDEPATH += $$PWD/../Core \
                            $$PWD/../SubUIFrame
# @brief ����·��
DEPENDPATH += $$PWD/../Core \   # DEPENDPATH ��ָ����Щ�ļ����޸ĺ���Ҫ�������� qmake ��·��
                           $$PWD/../SubUIFrame

SOURCES += \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    mainwindow.h


# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


