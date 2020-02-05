#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "databaseconnector.h"
#include "userinfo.h"
#include "sqlquerymodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<DatabaseConnector>("com.tylnesh.databaseconnector", 1, 0, "DatabaseConnector");
    qmlRegisterType<UserInfo>("com.tylnesh.userinfo", 1, 0, "UserInfo");

    DatabaseConnector db;
    db.establishConnection();


    SqlQueryModel *model1 = new SqlQueryModel(0);
    model1->setQuery("SELECT * FROM User");



    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("userModel", model1);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
