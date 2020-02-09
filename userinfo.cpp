#include "userinfo.h"

UserInfo::UserInfo(QObject *parent) : QObject(parent)
{

}

QString UserInfo::id(){
    return _id;
}

void UserInfo::setId(const QString &id){
    if (id == _id) return;
    _id = id;
    emit idChanged();
}

QString UserInfo::username(){
    return _username;
}

void UserInfo::setUsername(const QString &username){
    if (username == _username) return;
    _username = username;
    emit usernameChanged();
}

QString UserInfo::password(){
    return _password;
}

void UserInfo::setPassword(const QString &password){
    if (password == _password) return;
    _password = password;
    emit passwordChanged();
}

QString UserInfo::yearOfBirth(){
    return _yearOfBirth;
}

void UserInfo::setYearOfBirth(const QString &yearOfBirth){
    if (yearOfBirth == _yearOfBirth) return;
    _yearOfBirth = yearOfBirth;
    emit yearOfBirthChanged();
}

QString UserInfo::gender(){
    return _gender;
}

void UserInfo::setGender(const QString &gender){
    if (gender == _gender) return;
    _gender = gender;
    emit genderChanged();
}

QString UserInfo::education(){
    return _education;
}

void UserInfo::setEducation(const QString &education){
    if (education == _education) return;
    _education = education;
    emit educationChanged();
}

QString UserInfo::isAdmin(){
    return _isAdmin;
}

void UserInfo::setIsAdmin(const QString &isAdmin){
    if (isAdmin == _isAdmin) return;
    _isAdmin = isAdmin;
    emit isAdminChanged();
}
