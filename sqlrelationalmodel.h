#ifndef SQLRELATIONALMODEL_H
#define SQLRELATIONALMODEL_H
#pragma once
#include <QObject>
#include <QSqlQueryModel>
#include <QSqlRelationalTableModel>

class SqlRelationalModel : public QSqlRelationalTableModel
{
    Q_OBJECT

public:
    explicit SqlRelationalModel(QObject *parent = nullptr);

    Q_INVOKABLE QVariant data(const QModelIndex &index, int role=Qt::DisplayRole ) const;
    void generateRoleNames();
    virtual QHash<int, QByteArray> roleNames() const{return _roles;}



private:
    QHash<int, QByteArray> _roles;




};

#endif

