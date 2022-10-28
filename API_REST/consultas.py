import pymysql
host = 'iu51mf0q32fkhfpl.cbetxkdyhwsb.us-east-1.rds.amazonaws.com'
database = 'yv9v0x1jhaa2cz3v'
user = 'onshtn8w8en5oyay'
password = 'a6g8e1wccfbie7dv'

def Pregunta1():
    conexion = pymysql.connect (host=host, database=database, user =user, password=password)
    cursor = conexion.cursor()
    cursor.execute(
        '''SELECT COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Puntuales en la salida'
        FROM vuelo
        WHERE (Hora_SalidaR - Hora_SalidaP) <= 15;''')
    for dato in cursor:
        pass
    conexion.close()
    return("Porcentaje de vuelos que han salido antes de los 15 min:"+' '+str(dato[0])+'%')

def Pregunta2():
    conexion = pymysql.connect (host=host, database=database, user =user, password=password)
    cursor = conexion.cursor()
    cursor.execute(
        '''SELECT COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Puntuales en la llegada'
        FROM vuelo
        WHERE (Hora_LlegadaR - Hora_LlegadaP) <= 15;''')
    for dato in cursor:
        pass
    conexion.close()
    return("Porcentaje de vuelos que han llegado antes de los 15 min:"+' '+str(dato[0])+'%')

def Pregunta3():
    conexion = pymysql.connect (host=host, database=database, user =user, password=password)
    cursor = conexion.cursor()
    cursor.execute(
        '''SELECT a.Aeropuerto, AVG(v.Hora_SalidaR - v.Hora_SalidaP) AS 'Retraso'
        FROM vuelo AS v
        JOIN aeropuerto_o AS a
        ON v.ID_Aeropuerto_O = a.ID_Aeropuerto
        WHERE v.ID_EstadoVuelo = 'E'
        GROUP BY v.ID_Aeropuerto_O
        ORDER BY Retraso DESC
        LIMIT 10
        OFFSET 5;''')
    conexion.close()
    return cursor.fetchall()


def Pregunta4():
    conexion = pymysql.connect (host=host, database=database, user =user, password=password)
    cursor = conexion.cursor()
    cursor.execute(
        '''SELECT a.Aeropuerto, AVG(v.Hora_SalidaR - v.Hora_SalidaP) AS 'Retraso'
        FROM vuelo AS v
        JOIN aeropuerto_o AS a
        ON v.ID_Aeropuerto_O = a.ID_Aeropuerto
        WHERE v.ID_EstadoVuelo = 'E'
        GROUP BY v.ID_Aeropuerto_O
        ORDER BY Retraso ASC
        LIMIT 10
        OFFSET 5;''')
    conexion.close()
    return cursor.fetchall()


def Pregunta5():
    conexion = pymysql.connect (host=host, database=database, user =user, password=password)
    cursor = conexion.cursor()
    cursor.execute(
        '''SELECT a.Aeropuerto, COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Porcentaje de aropuertos O'
        FROM vuelo as v
        JOIN aeropuerto_o as a
        ON v.ID_Aeropuerto_O = a.ID_Aeropuerto
        GROUP BY a.ID_Aeropuerto
        ORDER BY COUNT(*) DESC
        LIMIT 10;''')
    salida = []
    for dato in cursor:
        salida.append(dato)
    conexion.close()
    return salida


def Pregunta6():
    conexion = pymysql.connect (host=host, database=database, user =user, password=password)
    cursor = conexion.cursor()
    cursor.execute(
        '''SELECT a.Aeropuerto, COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Porcentaje de aeropuertos D'
        FROM vuelo as v
        JOIN aeropuerto_d as a
        ON v.ID_Aeropuerto_D = a.ID_Aeropuerto
        GROUP BY a.ID_Aeropuerto
        ORDER BY COUNT(*) DESC
        LIMIT 10;''')
    salida = []
    for dato in cursor:
        salida.append(dato)
    conexion.close()
    return salida


def Pregunta7():
    conexion = pymysql.connect (host=host, database=database, user =user, password=password)
    cursor = conexion.cursor()
    cursor.execute(
        '''SELECT a.Aerolinea, COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Porcentaje de aerolinea'
        FROM vuelo as v
        JOIN aerolinea as a
        ON v.ID_Aerolinea = a.ID_Aerolinea
        GROUP BY v.ID_Aerolinea
        ORDER BY COUNT(*) DESC
        LIMIT 10;''')
    salida = []
    for dato in cursor:
        salida.append(dato)
    conexion.close()
    return salida


def Pregunta8():
    conexion = pymysql.connect (host=host, database=database, user =user, password=password)
    cursor = conexion.cursor()
    cursor.execute(
        '''SELECT DAYNAME(Fecha) AS 'Dia', COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Porcentaje de vuelos'
        FROM vuelo
        GROUP BY DAYNAME(Fecha)
        ORDER BY COUNT(*) DESC;''')
    salida = []
    for dato in cursor:
        salida.append(dato)
    conexion.close()
    return salida

def Pregunta9():
    conexion = pymysql.connect (host=host, database=database, user =user, password=password)
    cursor = conexion.cursor()
    cursor.execute(
        '''SELECT MONTHNAME(Fecha) AS 'Mes', COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Porcentaje de vuelos'
        FROM vuelo
        GROUP BY MONTHNAME(Fecha)
        ORDER BY COUNT(*) DESC;''')
    salida = []
    for dato in cursor:
        salida.append(dato)
    conexion.close()
    return salida

def query(query_):
    conexion = pymysql.connect (host=host, database=database, user =user, password=password)
    cursor = conexion.cursor()
    cursor.execute(query_)
    conexion.close()
    return cursor.fetchall()