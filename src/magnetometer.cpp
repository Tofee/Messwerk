#include <qmath.h>

#include "magnetometer.h"


Magnetometer::Magnetometer(bool updateInternally, QObject *parent)
    : Sensor(parent)
{
    m_sensor = new QMagnetometer(this);

    if(updateInternally) {
        QObject::connect(m_sensor, SIGNAL(readingChanged()), this, SLOT(refresh()));
    }
}

Magnetometer::~Magnetometer()
{
}

void Magnetometer::refresh(void)
{
    if(!m_sensor->isActive()) {
        return;
    }

    QMagnetometer *magnetometer = dynamic_cast<QMagnetometer*>(m_sensor);
    QMagnetometerReading *reading = magnetometer->reading();

    m_mx = reading->x();
    m_my = reading->y();
    m_mz = reading->z();

    m_precision = reading->calibrationLevel();

    emit mxChanged();
    emit myChanged();
    emit mzChanged();
    emit precisionChanged();
}
