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


public:
    explicit DatabaseConnector(QObject *parent = nullptr);

    Q_INVOKABLE void establishConnection();
    Q_INVOKABLE void hashPassword();
    Q_INVOKABLE void submitRegistration(UserInfo &userInfo);

    QString inputPassword();

    void setInputPassword(const QString &inputPassword);




signals:
    void inputPasswordChanged();

public slots:

private:
    QString _inputPassword;
};

#endif // DATABASECONNECTOR_H
