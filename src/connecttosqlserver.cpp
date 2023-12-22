#include "connecttosqlserver.h"

QString ConnectToSQLServer::WorkingWithAFile(QString SQLQuery)
{
    QString response;
    QFile file("C:\\Python\\dist\\hui.txt");
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text))
    {
        qDebug() << "Не удалось открыть файл ";
    }

    qDebug() << "записало";
    QTextStream out(&file);
    out << SQLQuery;
    file.close();

    StartExe();//отправляем запрос

    QFile fileR("C:\\Python\\dist\\hui.txt");
    if (!fileR.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        qDebug() << "Не удалось открыть файл ";
    }
    // Создаем объект QTextStream и связываем его с объектом QFile
    QTextStream in(&fileR);

    // Читаем содержимое файла
    response = in.readAll();
    fileR.close();
    return response;
}

void ConnectToSQLServer::StartExe()
{
    // Путь к исполняемому файлу
    QString exePath = "C:\\Python\\dist\\Untitled-1.exe";

    // Формируем команду для выполнения
    QString command = QString("cmd /c \"%1\"").arg(exePath);

    // Запускаем внешний процесс с использованием системной команды
    int exitCode = system(command.toUtf8().constData());
    qDebug() << exitCode;
}

ConnectToSQLServer::ConnectToSQLServer() {}

QString ConnectToSQLServer::SendQuery(QString SQLQuery)
{
    return WorkingWithAFile(SQLQuery);
}
