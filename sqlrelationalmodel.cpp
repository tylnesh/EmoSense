#include "sqlrelationalmodel.h"
#include <QSqlRecord>
#include <QSqlRelationalTableModel>

SqlRelationalModel::SqlRelationalModel(QObject *parent) : QSqlRelationalTableModel(parent)
{

}



QVariant SqlRelationalModel::data ( const QModelIndex & index, int role ) const
{
    if(index.row() >= rowCount())
    {
        return QString("");
    }
    if(role < Qt::UserRole)
    {
        return QSqlQueryModel::data(index, role);
    }
    else
    {
        // search for relationships
        for (int i = 0; i < columnCount(); i++)
        {
            if (this->relation(i).isValid())
            {
            return record(index.row()).value(QString(_roles.value(role)));
            }
        }
    // if no valid relationship was found
    return QSqlQueryModel::data(this->index(index.row(), role - Qt::UserRole - 1), Qt::DisplayRole);
    }
}

void SqlRelationalModel::generateRoleNames()
{
    _roles.clear();
    int nbCols = this->columnCount();

    for (int i = 0; i < nbCols; i++)
    {
        _roles[Qt::UserRole + i + 1] = QVariant(this->headerData(i, Qt::Horizontal).toString()).toByteArray();
    }
}
