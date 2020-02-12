#ifndef DATABASECONNECTOR_H
#define DATABASECONNECTOR_H
#include <QtSql>
#include <QSqlDatabase>
#include "connectioninfo.h"
#include <QObject>
#include "userinfo.h"
class DatabaseConnector : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString inputPassword READ inputPassword WRITE setInputPassword NOTIFY inputPasswordChanged)
    Q_PROPERTY(QString inputUsername READ inputUsername WRITE setInputUsername NOTIFY inputUsernameChanged)


public:
    explicit DatabaseConnector(QObject *parent = nullptr);

    Q_INVOKABLE void establishConnection();
    Q_INVOKABLE int login();

    Q_INVOKABLE QString hashPassword(QString password);
    Q_INVOKABLE bool submitRegistration(UserInfo *userInfo);


    Q_INVOKABLE bool updateUser(UserInfo *userInfo);
    Q_INVOKABLE bool updateQuestionnaireName(QString name);

    Q_INVOKABLE bool deleteUser(QString userId);
    Q_INVOKABLE bool deleteQuestionnaire(QString questionnaireId);

    Q_INVOKABLE void createUserModel();
    Q_INVOKABLE bool createQuestionnaire(QString name);




    QString inputPassword();
    QString inputUsername();

    void setInputPassword(const QString &inputPassword);
    void setInputUsername(const QString &inputUsername);






signals:
    void inputPasswordChanged();
    void inputUsernameChanged();

public slots:

private:
    QString _inputPassword;
    QString _inputUsername;

};

#endif // DATABASECONNECTOR_H
