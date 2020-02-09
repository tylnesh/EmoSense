#ifndef USERINFO_H
#define USERINFO_H

#include <QObject>

class UserInfo : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id READ id WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString username READ username WRITE setUsername NOTIFY usernameChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)
    Q_PROPERTY(QString yearOfBirth READ yearOfBirth WRITE setYearOfBirth NOTIFY yearOfBirthChanged)
    Q_PROPERTY(QString gender READ gender WRITE setGender NOTIFY genderChanged)
    Q_PROPERTY(QString education READ education WRITE setEducation NOTIFY educationChanged)
    Q_PROPERTY(QString isAdmin READ isAdmin WRITE setIsAdmin NOTIFY isAdminChanged)

public:
    explicit UserInfo(QObject *parent = nullptr);

    // getters
    QString id();
    QString username();
    QString password();
    QString yearOfBirth();
    QString gender();
    QString education();
    QString isAdmin();


    //setters
    void setId(const QString &id);
    void setUsername(const QString &username);
    void setPassword(const QString &password);
    void setYearOfBirth(const QString &yearOfBirth);
    void setGender(const QString &gender);
    void setEducation(const QString &education);
    void setIsAdmin(const QString &isAdmin);



signals:
    void idChanged();
    void usernameChanged();
    void passwordChanged();
    void yearOfBirthChanged();
    void genderChanged();
    void educationChanged();
    void isAdminChanged();


public slots:

private:
    QString _id, _username, _password, _yearOfBirth, _gender, _education, _isAdmin;
};

#endif // USERINFO_H
