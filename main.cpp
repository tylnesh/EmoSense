#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "databaseconnector.h"
#include "userinfo.h"
#include "sqlquerymodel.h"
#include "sqlrelationalmodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<DatabaseConnector>("com.tylnesh.databaseconnector", 1, 0, "DatabaseConnector");
    qmlRegisterType<UserInfo>("com.tylnesh.userinfo", 1, 0, "UserInfo");

    DatabaseConnector db;
    db.establishConnection();


   // SqlQueryModel *userModel = new SqlQueryModel(0);
   // userModel->setQuery("SELECT * FROM User");

    SqlRelationalModel *questionnaireModel = new SqlRelationalModel;

    questionnaireModel->setTable("Questionnaire");
    questionnaireModel->generateRoleNames();
    questionnaireModel->select();

    SqlRelationalModel *userModel = new SqlRelationalModel;

    userModel->setTable("User");
    userModel->generateRoleNames();
    userModel->select();




    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("userModel", userModel);
    engine.rootContext()->setContextProperty("questionnaireModel",questionnaireModel);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
