#include "sqlquerymodel.h"
#include <QSqlRecord>
#include <QSqlField>
#include <QDebug>

SqlQueryModel::SqlQueryModel(QObject *parent) :
    QSqlQueryModel(parent)
{
}

void SqlQueryModel::setQuery(const QString &query, const QSqlDatabase &db)
{
    QSqlQueryModel::setQuery(query, db);
    _sqlQuery = QSqlQuery(query,db);
    generateRoleNames();
}

void SqlQueryModel::setQuery(const QSqlQuery & query)
{
    QSqlQueryModel::setQuery(query);
    _sqlQuery = QSqlQuery(query);
    generateRoleNames();
}

void SqlQueryModel::generateRoleNames()
{
    m_roleNames.clear();
    for( int i = 0; i < record().count(); i ++) {
        qDebug() << record().fieldName(i).toUtf8();
        m_roleNames.insert(Qt::UserRole + i + 1, record().fieldName(i).toUtf8());
    }
}

QVariant SqlQueryModel::data(const QModelIndex &index, int role) const
{
    QVariant value;

    if(role < Qt::UserRole) {
        value = QSqlQueryModel::data(index, role);
    }
    else {

        int columnIdx = role - Qt::UserRole - 1;
        QModelIndex modelIndex = this->index(index.row(), columnIdx);
        qDebug() << "index.row() =" << index.row();
        qDebug()<< "columnIdx = " << role << " - " << Qt::UserRole << "- 1" << "=" << columnIdx;


        value = QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
    }
    return value;
}

QVariant SqlQueryModel::getData(const QModelIndex &index){
     QVariant value;
    int columnIdx = 1 - Qt::UserRole - 1;
    QModelIndex modelIndex = this->index(index.row(), columnIdx);
    value = QSqlQueryModel::data(modelIndex, Qt::DisplayRole);

    return value;


}
void SqlQueryModel::refresh(){
    this->clear();
    this->query().clear();
    this->setQuery(_sqlQuery);
    emit dataChanged();
}
