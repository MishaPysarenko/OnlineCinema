// MyDataModel.h
#ifndef MYDATAMODEL_H
#define MYDATAMODEL_H

#include <QObject>
#include <QList>

class ModelList : public QObject
{
    Q_OBJECT
public:
    explicit ModelList(QObject *parent = nullptr);

    Q_INVOKABLE QList<QString> getMovisL() const;
    Q_INVOKABLE QList<QString> getReviews() const;
    Q_INVOKABLE QList<QString> getSessions() const;
private:
    QList<QString> m_MovisL;
    QList<QString> m_Reviews;
    QList<QString> m_Sessions;
};

#endif // MYDATAMODEL_H
