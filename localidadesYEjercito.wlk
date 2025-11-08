import personajesYRoles.*

// EJERCITO
class Ejercito {
  const personajes = []
  method personajes() = personajes
  method tamaño() = personajes.size()
  method poderOfensivo() = personajes.sum({ p => p.potencialOfensivo() })
  method invadir(unaLocalidad) {
    if (self.puedeTomarLocalidad(unaLocalidad)) unaLocalidad.serOcupada(self)
  }
  method puedeTomarLocalidad(
    unaLocalidad
  ) = self.poderOfensivo() > unaLocalidad.poderDefensivo()
  method losMasPoderosos() = self.ordenadosLosMasPoderosos().take(10)
  method ordenadosLosMasPoderosos() = personajes.sortedBy(
    { p => p.potencialOfensivo() }
  ).reverse()
  method quitarLosMasFuertes() {
    personajes.removeAll(self.losMasPoderosos())
  }
} 

// LOCALIDADES
class Localidad {
  var ejercito
  var cantHabitantesActual
  method ejercito() = ejercito
  method cantidadHabitantesActual() = cantHabitantesActual
  method poderDefensivo() = ejercito.poderOfensivo()
  method serOcupada(unEjercito)
}

class Aldea inherits Localidad {
  const maximoHabitantes
  method maximoHabitantes() = maximoHabitantes
  override method serOcupada(unEjercito) {
    if (maximoHabitantes < unEjercito.tamaño()) {
      ejercito = new Ejercito(personajes = unEjercito.losMasPoderosos())
      unEjercito.quitarLosMasFuertes()
      cantHabitantesActual = 10
    } else {
      ejercito = unEjercito
      cantHabitantesActual = unEjercito.tamaño()
    }
  }
}

class Ciudad inherits Localidad {
  override method poderDefensivo() = super() + 300
  override method serOcupada(unEjercito) {
    ejercito = unEjercito
    cantHabitantesActual = unEjercito.tamaño()
  }
}