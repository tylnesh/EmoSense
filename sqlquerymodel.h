#ifndef SQLQUERYMODEL_H
#define SQLQUERYMODEL_H
#pragma once
#include <QObject>
#include <QSqlQueryModel>
#include <QSqlQuery>

class SqlQueryModel : public QSqlQueryModel
{
    Q_OBJECT

public:
    explicit SqlQueryModel(QObject *parent = nullptr);

    void setQuery(const QString &query, const QSqlDatabase &db = QSqlDatabase());
    void setQuery(const QSqlQuery &query);
    QVariant data(const QModelIndex &index, int role) const;
    Q_INVOKABLE QHash<int, QByteArray> roleNames() const {	return m_roleNames;	}
    Q_INVOKABLE void refresh();
   // Q_INVOKABLE QSqlRecord record(int row) const;

    Q_INVOKABLE QVariant getData(const QModelIndex &index);
private:
    void generateRoleNames();
    QHash<int, QByteArray> m_roleNames;
    QSqlQuery _sqlQuery;
};


#endif // SQLQUERYMODEL_H
