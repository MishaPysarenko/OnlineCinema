#include "backend.h"

BackEnd::BackEnd() {}

bool BackEnd::sendFindUsr(QString name, QString email)
{
    QString Query = "SELECT * FROM viewers WHERE [Name] = '" + name +  "' AND [Email] = '"+ email +"';";
    qDebug() << SQL.SendQuery(Query);
    if(!SQL.SendQuery(Query).isEmpty())
    {
        return 0;
    }
    return 1;
}

void BackEnd::sendRedUsr(QString name, QString email)
{
    QString Query = "INSERT INTO viewers (Name, Email, RegistrationDate)VALUES ('"+ name + "', '"+ email +"', GETDATE());";
    qDebug() << SQL.SendQuery(Query);
}

void BackEnd::sendRedMov(QString name, QString release, QString genre, QString director)
{
    QString Query = "INSERT INTO movies (Title, ReleaseYear, Genre, Director)VALUES ('"+ name + "', "+ release +", '"+ genre +"', '"+ director +"');";
    qDebug() << SQL.SendQuery(Query);
}

QStandardItemModel *BackEnd::getMovisListModel()
{
    // Создаем модель
    QStandardItemModel* model = new QStandardItemModel();

    // Заполняем модель данными из базы данных
    QString query = "SELECT [Title], [ReleaseYear],[Genre],[Director]FROM[db_online_cinema].[dbo].[movies];";
    QString queryResult = SQL.SendQuery(query);

    // Проверяем на наличие ошибок в результате выполнения запроса
    if (queryResult.isEmpty()) {
        qDebug() << "Database error: " << queryResult;
        return nullptr;// Возвращаем nullptr в случае ошибки
    }

    int row = 0;

    while (!queryResult.isEmpty()) {
        int newlineIndex = queryResult.indexOf('\n');
        QString resultList;

        if (newlineIndex == -1) {
            resultList = queryResult;
            queryResult.clear();
        } else {
            QString extractedString = queryResult.left(newlineIndex);
            queryResult.remove(0, newlineIndex + 1);
            resultList = extractedString;
        }
        QStandardItem* itemName = new QStandardItem(resultList);
        model->setItem(row, 0, itemName);
        row++;
    }

    return model;
}


