#include "modellist.h"



ModelList::ModelList(QObject *parent)
{

}

QList<QString> ModelList::getMovisL() const
{

    return m_MovisL;
}

QList<QString> ModelList::getReviews() const
{

    return m_Reviews;
}

QList<QString> ModelList::getSessions() const
{

    return m_Sessions;
}
