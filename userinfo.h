#ifndef USERINFO_H
#define USERINFO_H

#include <QObject>

class UserInfo : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString username READ username WRITE setUsername NOTIFY usernameChanged)
    Q_PROPERT


public:
    explicit UserInfo(QObject *parent = nullptr);

    // getters
    QString username();
    QString password();
    QString yearOfBirth();
    QString gender();
    QString education();
    QString isAdmin();

    //setters
    void setUsername(const QString &username);
    void setPassword(const QString &password);
    void setYearOfBirth(const QString &yearOfBirth);
    void setGender(const QString &gender);
    void setEducation(const QString &education);
    void setIsAdmin(const QString &isAdmin);



signals:
    void usernameChanged();
    void passwordChanged();
    void yearOfBirthChanged();
    void genderChanged();
    void educationChanged();
    void isAdminChanged();


public slots:

private:
    QString _username, _password, _yearOfBirth, _gender, _education, _isAdmin;
};

#endif // USERINFO_H
