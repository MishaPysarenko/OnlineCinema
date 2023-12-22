#ifndef DATABASECONNECTION_H
#define DATABASECONNECTION_H

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include <windows.h>
#include <sql.h>
#include <sqlext.h>

class DataBaseConnection
{
    QSqlDatabase db;
    QSqlQuery query;
    void CloseConnect();

public:
    DataBaseConnection();
    bool Connect();
    ~DataBaseConnection();
};

#endif // DATABASECONNECTION_H
