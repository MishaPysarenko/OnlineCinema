#include "databaseconnection.h"

DataBaseConnection::DataBaseConnection() {}

bool DataBaseConnection::Connect()
{
    db = QSqlDatabase::addDatabase("QPSQL");

    // Параметры подключения
    //db.setHostName("localhost");
    db.setDatabaseName("db_online_cinema");
    db.setUserName("Mike");
    db.setPassword("1234");
    db.setPort(5432);
    if (db.open())
    {
        qDebug() << "Connection";
        return true;
    }
    else
    {
        qDebug() << "Error";
        return false;
    }
}

void DataBaseConnection::CloseConnect()
{
    db.close();
}

DataBaseConnection::~DataBaseConnection()
{
    CloseConnect();
}
