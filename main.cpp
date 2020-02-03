#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "databaseconnector.h"
#include "userinfo.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<DatabaseConnector>("com.tylnesh.databaseconnector", 1, 0, "DatabaseConnector");
    qmlRegisterType<UserInfo>("com.tylnesh.userinfo", 1, 0, "UserInfo");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
