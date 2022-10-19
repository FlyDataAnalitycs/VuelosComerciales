from meteostat import Hourly, Stations
import pandas as pd
from datetime import datetime
import os
import shutil

# Fuente de los datos
url = 'https://raw.githubusercontent.com/FlyDataAnalitycs/VuelosComerciales/main/vueloSB.csv'
cancel_w = pd.read_csv(url)

# se revisa que se cargaron correctamente los datos
if cancel_w.empty:
    print('no hay datos')
    input()
else:
    print('datos leídos correctamente')
    print('Presione cualquier tecla para continuar')
    input()

# Se duplican las dos ultimas filas para dividir el dataset 
# en un numero entero para procesarolo más fácil
cancel_w = pd.concat([cancel_w,cancel_w.iloc[-3:-1]])

# Se revisa el tamaño del dataset para el procesamiento
if len(cancel_w) == 255000:
    print('dataset completo, presione cualquier tecla para continuar')
    input()
else:
    print('Dataset incompleto')
    input()

print('desea crear nuevas carpetas y si es el caso borrar las carpetas anteriores (si/no)')
borrar = input()

# Si no se han creado, se crean las carpetas que se van a usar
# además, si se quiere eliminar todo el contenido de las carpetas es posible seleccionando si

if borrar == 'si':
    if os.path.exists('datosClima/'):
        shutil.rmtree('datosClima/')
    os.makedirs('datosClima/DatosObtenidos/', exist_ok=True)
    os.makedirs('datosClima/DatosFaltantes/', exist_ok=True)

# Se hacen 24 iteraciones dividiendo el dataset en tandas de 10625 filas
for j in range(15,25):

    # Creación de los dataframes que van a almacenar los datos
    df_weather = pd.DataFrame(columns=['ID_Vuelo', 'temp', 'prcp', 'snow', 'wdir', 'wspd', 'wpgt', 'pres', 'coco'])
    df_weather_falta = pd.DataFrame(columns=['Año','Mes','Dia','ID_Vuelo','ID_Aeropuerto_O','Hora_SalidaR','Latitud','Longitud'])

    # se itera en los rangos establecidos
    for i in range((j-1)*10625, j*10625):

        # Fecha y hora de la consulta
        year = cancel_w['Año'][i]
        month = cancel_w['Mes'][i]
        day = cancel_w['Dia'][i]

        if len(str(cancel_w['Hora_SalidaR'][i])) <= 2:
            hour = 1
        elif int(str(cancel_w['Hora_SalidaR'][i])[:-2]) == 23:
            hour = 23
        else:
            hour = int(str(cancel_w['Hora_SalidaR'][i])[:-2])

        start = datetime(year, month, day, hour, 0)
        end = datetime(year, month, day, hour,  1)

        # Estación meteorológica de la consulta
        stations = Stations()
        stations = stations.nearby(cancel_w['Latitud'][i], cancel_w['Longitud'][i])
        point = stations.fetch(1)

        # Consulta por hora
        data = Hourly(point, start, end)
        data = pd.DataFrame(data.fetch()).reset_index()
        
        # Datos que no pudieron ser consultados se guardan en otra tabla
        if (data.empty):
            df_weather_falta = pd.concat([df_weather_falta, cancel_w.iloc[i:i+1]])

        # A los datos consultados se les agrega el Id de vuelo
        else:
            data['ID_Vuelo'] = cancel_w['ID_Vuelo'][i]

        # Concatenación de los datos de la consulta actual a los consultados anteriormente
        df_weather = pd.concat([df_weather, data])

    # Se toman las variables importantes
    df_weather = df_weather[['ID_Vuelo', 'temp', 'prcp', 'snow', 'wdir', 'wspd', 'wpgt', 'pres', 'coco']]
    
    # Se guardan los datos tanto obtenidos como los que no pudieron ser consultados
    df_weather.to_csv('datosClima/DatosObtenidos/' + str(j) + 'df_weather.csv',index=False)
    if not df_weather_falta.empty:
        df_weather_falta.to_csv('datosClima/DatosFaltantes/' + str(j) + 'df_weather_falta.csv',index=False)