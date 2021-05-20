class Castillo {

    var estabilidad = 150
    const rey = []
    const burocratas = []
    const guardias = []
    var lista = []
    var muralla = 60 // metros

    method derrota() = estabilidad < 100

    method estabilidad() = estabilidad

    method asignarRey(unRey) {
        rey.add(unRey)
    }

    method rey() = rey.first()

    method agregarGuardias(x, unAmbiente) {                                    // Permite agregar una cantidad x de guardias a un ambiente 
        x.times{ i => guardias.add(new Guardia( ambiente = unAmbiente ))}
    }

    method fiestas() {
        if (estabilidad > 125) {
            guardias.forEach{ x => x.descansar()}
            burocratas.forEach{ x => x.olvidarMiedo()}
        }
    }

    method guardiasDescansados() {
        return guardias.all{ x => x.nivelDeAgotamiento() == 1 }
    }

    method burocratasSinMiedo() = burocratas.filter{ x => x.miedo() == false }

    method guardiasSuma() = guardias.sum{ x => x.capacidad() }

    method defensas() {
        estabilidad = estabilidad + self.guardiasSuma() + self.burocratasSinMiedo().size()
    }

    method asignarBurocrata(unBurocrata) {
        burocratas.add(unBurocrata)
    }

    method burocratas() = burocratas

    method guardiasDelCastillo() {
        return guardias.filter{ x => x.ambiente() == castillo }
    }

    method burocratasAsustados() {
        return self.burocratasSinExp() + self.burocratasJovenes()
    }

    method burocratasSinExp() {
        return burocratas.filter{ x => x.experiencia() < 4 }
    }

    method burocratasJovenes() {
        return burocratas.filter{ x => x.edad() < 30 }
    }

    method ataques() {
        if (muralla < 50) {
            estabilidad = estabilidad - 70
        } else {
            estabilidad = estabilidad - 1
        }
        self.guardiasDelCastillo().forEach{ x => x.atacar()}
        self.burocratasAsustados().forEach{ x => x.asustense()}
    }

}

class Rey {

    const castillo = []

    method atacar(unCastillo) {
        unCastillo.ataques()
    }

    method hacerUnaFiesta() {
        castillo.first().fiestas()
    }

    method asignarCastillo(unCastillo) {
        castillo.add(unCastillo)
    }

    method castillo() = castillo.first()

    method dondeAtacar() {
        return wwwtodoscastilloscom.informacion()
    }

}

class Reina {

    const castillo = []

    method asignarCastillo(unCastillo) {
        castillo.add(unCastillo)
    }

    method elegirBurocrata(unBurocrata) {
        castillo.asignarBurocrata(unBurocrata)
    }

    method dondeAtacar() {
        return wwwtodoscastilloscom.capacidad()
    } // A comparaciÃ³n del rey la reina solo puede atacar a los castillos en donde la suma total de las capacidades de cada guardia es menor a 300

}

class Burocrata {

    var nombre = " burocrata "
    var fechaDeNacimiento = " 1/2/875"
    var edad = 60
    var experiencia = 4
    var miedo = true
    var castillo = []

    method nombre() = nombre

    method fechaDeNacimiento() = fechaDeNacimiento

    method experiencia() = experiencia

    method asignarCastillo(unCastillo) {
        castillo.add(unCastillo)
    }

    method edad() = edad

    method miedo() = miedo

    method olvidarMiedo() {
        miedo = false
    }

    method asustense() {
        miedo = true
    }

}

class Guardia {

    var capacidad = 5
    var agotamiento = 1
    var ambiente = castillo

    method capacidad() = capacidad

    method ambiente() = ambiente

    method nivelDeAgotamiento() = agotamiento

    method descansar() {
        agotamiento = agotamiento + 2
    }

    method atacar() {
        agotamiento = agotamiento - 5
    }

}

object wwwtodoscastilloscom {

    const castillos = []

    method informacion() = castillos.filter{ x => x.estabilidad() < 125 }  
    
    method derrotados() = castillos.filter{ x => x.estabilidad( ) < 100 }
    
    method capacidad() {
        return castillos.filter{ x => x.guardiasSuma() < 300 }
    }

    method agregar(unCastillo) {
        castillos.add(unCastillo)
    }

}


// declaro objetos ambiente del castillo

object castillo {} 

object guarida {} 

object despensa {}

object casilladevigilancia {}
