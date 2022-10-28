from fastapi import FastAPI
from pydantic import BaseModel
import consultas


app = FastAPI()

@app.get("/Pregunta_N°1")
def Porcentaje_Aeropuertos_Puntuales_Salida():
    return consultas.Pregunta1()

@app.get("/Pregunta_N°2")
def Porcentaje_Aeropuertos_Puntuales_Llegada():
    return consultas.Pregunta2()

@app.get("/Pregunta_N°3")
def Aeropuertos_Mas_Impuntuales_Salida():
    return consultas.Pregunta3()

@app.get("/Pregunta_N°4")
def Aeropuertos_Mas_Puntuales_Salida():
    return consultas.Pregunta4()

@app.get("/Pregunta_N°5")
def Porcentaje_Vuelos_X_Aeropuerto_Origen():
    return consultas.Pregunta5()

@app.get("/Pregunta_N°6")
def Porcentaje_Vuelos_X_Aeropuerto_Destino():
    return consultas.Pregunta6()

@app.get("/Pregunta_N°7")
def Porcentaje_Vuelos_X_Aerolinea():
    return consultas.Pregunta7()

@app.get("/Pregunta_N°8")
def Porcentaje_Vuelos_X_DiaSemana():
    return consultas.Pregunta8()

@app.get("/Pregunta_N°9")
def Porcentaje_Vuelos_X_Mes():
    return consultas.Pregunta9()

@app.get("/Consulta/")
def Insertar_Query_MySQL(Query: str):
    return (consultas.query(Query))