 #include "databaseconnector.h"
#include "ultimatemagicstringobfuscator.h"
#include <QCryptographicHash>

DatabaseConnector::DatabaseConnector(QObject *parent) : QObject(parent)
{

}

void DatabaseConnector::establishConnection(){

    UltimateMagicStringObfuscator umso;


    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName(QString::fromStdString(umso.makeIp()));
    db.setUserName(QString::fromStdString(umso.makeLogin()));
    db.setPassword(QString::fromStdString(umso.makePassword()));
    db.setDatabaseName(QString::fromStdString(umso.makeName()));

    if(db.open()) qDebug() << "success!";
    else qDebug() << db.lastError();
}


QString DatabaseConnector::hashPassword(QString password) {

    UltimateMagicStringObfuscator umso;
    QByteArray pswNsalt = password.toUtf8() ;
    pswNsalt.append(QString::fromStdString(umso.makeSalt()).toUtf8()) ;
    QString hashedSaltedPsw = QCryptographicHash::hash(pswNsalt, QCryptographicHash::Sha256).toHex() ;
    qDebug() << "hashed psw: " << hashedSaltedPsw << endl ;

    return hashedSaltedPsw;
}


int DatabaseConnector::login(){
    QSqlQuery query;
    query.prepare("SELECT isAdmin FROM User WHERE Nick='"+inputUsername() +"' AND Password='"+hashPassword(inputPassword())+"'");

        int isAdmin = -1;

        query.exec();
    while (query.next()) {
          isAdmin = query.value(0).toInt();
        }
    //qDebug() << query.lastQuery();
    qDebug() << isAdmin;
    return isAdmin;

}


QString DatabaseConnector::inputPassword()
{
    return _inputPassword;
}

void DatabaseConnector::setInputPassword(const QString &inputPassword)
{
    if (inputPassword == _inputPassword)
        return;

    _inputPassword = inputPassword;
    emit inputPasswordChanged();
}

QString DatabaseConnector::inputUsername()
{
    return _inputUsername;
}

void DatabaseConnector::setInputUsername(const QString &inputUsername)
{
    if (inputUsername == _inputUsername)
        return;

    _inputUsername = inputUsername;
    emit inputUsernameChanged();
}







void DatabaseConnector::submitRegistration(UserInfo *userInfo){
    QSqlQuery query;
    query.prepare("INSERT INTO User (Nick, Password, Year_of_Birth, Gender, Education, isAdmin)"
                  "VALUES (:Nick, :Password, :Year_of_Birth, :Gender, :Education, :isAdmin )");

    query.bindValue(":Nick", userInfo->username());
    query.bindValue(":Password", hashPassword(userInfo->password()));
    query.bindValue(":Year_of_Birth", userInfo->yearOfBirth());
    query.bindValue(":Gender", userInfo->gender());
    query.bindValue(":Education", userInfo->education());
    query.bindValue(":isAdmin", userInfo->isAdmin());
    query.exec();
    qDebug() << query.lastError();



}
