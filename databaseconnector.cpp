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


void DatabaseConnector::hashPassword() {

    UltimateMagicStringObfuscator umso;
    QByteArray pswNsalt = inputPassword().toUtf8() ;
    pswNsalt.append(QString::fromStdString(umso.makeSalt()).toUtf8()) ;
    QByteArray hashedSaltedPsw = QCryptographicHash::hash(pswNsalt, QCryptographicHash::Sha256).toHex() ;
    qDebug() << "hashed psw: " << hashedSaltedPsw << endl ;

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
    qDebug() << "Unhashed pass: " << _inputPassword;
    emit inputPasswordChanged();
}

void DatabaseConnector::submitRegistration(UserInfo &userInfo){
    QSqlQuery query;
    query.prepare("INSERT INTO User (Nick, Password, Year_of_Birth, Gender, Education, isAdmin)"
                  "VALUES (:Nick, :Password, :Year_of_Birth, :Gender, :Education, :isAdmin )");

    query.bindValue(":Nick", userInfo.username());
    query.bindValue(":Password", userInfo.password());
    query.bindValue(":Nick", userInfo.username());
    query.bindValue(":Nick", userInfo.username());
    query.bindValue(":Nick", userInfo.username());


}
