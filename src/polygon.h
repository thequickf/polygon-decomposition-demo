#ifndef POLYGON_H
#define POLYGON_H

#include <QList>
#include <QObject>
#include <QPoint>

class Polygon : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<QPoint> polygonPoints READ polygonPoints NOTIFY polygonPointsChanged)
    Q_PROPERTY(QList<QPoint> trianglesLines READ trianglesLines NOTIFY trianglesLinesChanged)
public:
    explicit Polygon(QObject *parent = nullptr);

    QList<QPoint> polygonPoints() const;
    QList<QPoint> trianglesLines() const;

public slots:
    int polygonSize() const;
    int triangleNumber() const;
    void appendPoint(int x, int y);
    void clear();
    void triangulate();

signals:
    void polygonPointsChanged(QList<QPoint> polygonPoints);
    void trianglesLinesChanged(QList<QPoint> trianglesLines);

private:
    QList<QPoint> m_polygonPoints;
    QList<QPoint> m_trianglesLines;
};

#endif // POLYGON_H
