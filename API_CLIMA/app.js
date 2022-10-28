window.addEventListener('load', ()=> {
    let lon
    let lat

    let temperaturaValor = document.getElementById('temperatura-valor')  
    let temperaturaDescripcion = document.getElementById('temperatura-descripcion')  
    let ubicacion = document.getElementById('ubicacion')  
    let iconoAnimado = document.getElementById('icono-animado') 
    let nubosidad = document.getElementById('nubosidad') 
    let logistico = document.getElementById('probabilidad') 


    if(navigator.geolocation){
       navigator.geolocation.getCurrentPosition( posicion => {
           //console.log(posicion.coords.latitude)
           lon = posicion.coords.longitude
           lat = posicion.coords.latitude
           //ubicación actual    
           const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=a9d5c93450634953046c8aee04567128&units=metric&lang=es`

           //ubicación por ciudad
           //const url = `https://api.openweathermap.org/data/2.5/weather?q=Madrid&lang=es&units=metric&appid=a9d5c93450634953046c8aee04567128`

           //console.log(url)

           fetch(url)
            .then( response => { return response.json()})
            .then( data => {
              
                let temp = Math.round(data.main.temp)
                temperaturaValor.textContent = `${temp} ° C`
                let desc = data.weather[0].description
                temperaturaDescripcion.textContent = desc.toUpperCase()
                ubicacion.textContent = data.name
                nubosidad.textContent = `${data.clouds.all} %`

                let a0 = -0.14352485325618422
                let a1 = 0.2304432334511419
                let a2 = -1.2707013882031533

                let y = (1 / (1 + Math.exp(-(a0 + a1 * temp + (a2 * data.clouds.all * 10 / 100)))))*100

                logistico.textContent = `${y.toFixed(2)} %`
                
                //para iconos estáticos
                //const urlIcon = `http://openweathermap.org/img/wn/${iconCode}.png`                     
                //icono.src = urlIcon
                //console.log(data.weather[0].icon)

                //para iconos dinámicos
                console.log(data.weather[0].main)
                switch (data.weather[0].main) {
                    case 'Thunderstorm':
                      iconoAnimado.src='animated/thunder.svg'
                      console.log('TORMENTA');
                      break;
                    case 'Drizzle':
                      iconoAnimado.src='animated/rainy-2.svg'
                      console.log('LLOVIZNA');
                      break;
                    case 'Rain':
                      iconoAnimado.src='animated/rainy-7.svg'
                      console.log('LLUVIA');
                      break;
                    case 'Snow':
                      iconoAnimado.src='animated/snowy-6.svg'
                        console.log('NIEVE');
                      break;                        
                    case 'Clear':
                        iconoAnimado.src='animated/day.svg'
                        console.log('LIMPIO');
                      break;
                    case 'Atmosphere':
                      iconoAnimado.src='animated/weather.svg'
                        console.log('ATMOSFERA');
                        break;  
                    case 'Clouds':
                        iconoAnimado.src='animated/cloudy-day-1.svg'
                        console.log('NUBES');
                        break;  
                    default:
                      iconoAnimado.src='animated/cloudy-day-1.svg'
                      console.log('por defecto');
                  }

            })
            .catch( error => {
                console.log(error)
            })
       })
          
    }
})
