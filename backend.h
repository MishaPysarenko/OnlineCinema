#ifndef BACKEND_H
#define BACKEND_H

#include <QAbstractListModel>
#include <QObject>
#include <QQmlEngine>
#include <QStandardItemModel>
#include "src/connecttosqlserver.h"

#include <QTextStream>
#include <QFile>

class BackEnd : public QObject
{
    ConnectToSQLServer SQL;
    Q_OBJECT
    QML_ELEMENT
    QList<QString> m_MovisL;
public:
    BackEnd();
    Q_INVOKABLE bool sendFindUsr(QString name,QString emeil);
    Q_INVOKABLE void sendRedUsr(QString name,QString emeil);
    Q_INVOKABLE void sendRedMov(QString name,QString release,QString genre,QString director);
    Q_INVOKABLE QStandardItemModel *getMovisListModel();
};

#endif // BACKEND_H
