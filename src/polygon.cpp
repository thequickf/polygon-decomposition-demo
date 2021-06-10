#include <polygon.h>

#include <triangulation.h>

#include <vector>

Polygon::Polygon(QObject *parent) : QObject(parent)
{}

QList<QPoint> Polygon::polygonPoints() const
{
    return m_polygonPoints;
}

QList<QPoint> Polygon::trianglesLines() const
{
    return m_trianglesLines;
}

int Polygon::polygonSize() const
{
    return m_polygonPoints.size();
}

int Polygon::triangleNumber() const {
    return m_trianglesLines.size();
}

void Polygon::appendPoint(int x, int y) {
    m_polygonPoints.append({x, y});
    emit polygonPointsChanged(m_polygonPoints);
    emit trianglesLinesChanged(m_trianglesLines);
}

void Polygon::clear() {
    m_trianglesLines.clear();
    m_polygonPoints.clear();
}

void Polygon::triangulate()
{
    std::vector<geom::Point2D> polygon_v;
    for (const QPoint& point : m_polygonPoints) {
        polygon_v.push_back({static_cast<double>(point.x()), static_cast<double>(point.y())});
    }
    std::vector<geom::Triangle2D> triangles = geom::Triangulate(polygon_v);
    for (geom::Triangle2D triangle : triangles) {
        QPoint a = {static_cast<int>(triangle.a.x), static_cast<int>(triangle.a.y)};
        QPoint b = {static_cast<int>(triangle.b.x), static_cast<int>(triangle.b.y)};
        QPoint c = {static_cast<int>(triangle.c.x), static_cast<int>(triangle.c.y)};
        m_trianglesLines.append(a);
        m_trianglesLines.append(b);
        m_trianglesLines.append(b);
        m_trianglesLines.append(c);
        m_trianglesLines.append(c);
        m_trianglesLines.append(a);
    }
}
