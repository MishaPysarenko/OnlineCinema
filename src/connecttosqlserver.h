#ifndef CONNECTTOSQLSERVER_H
#define CONNECTTOSQLSERVER_H

#include <QFile>
#include <QTextStream>
#include <QProcess>
#include <QDebug>

class ConnectToSQLServer
{
    QString WorkingWithAFile(QString SQLQuery);
    void StartExe();
public:
    ConnectToSQLServer();
    QString SendQuery(QString SQLQuery);
};

#endif // CONNECTTOSQLSERVER_H
