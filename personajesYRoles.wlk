// PERSONAJES - RAZAS
class Personaje {
  var rol
  var fuerza
  var inteligencia
  method fuerza() = fuerza
  method inteligencia() = inteligencia
  method rol() = rol
  method cambiarFuerza(nuevaFuerza) {
    fuerza = nuevaFuerza
  }
  method cambiarInteligencia(nuevaInteligencia) {
    inteligencia = nuevaInteligencia
  }
  method cambiarRol(nuevoRol) {
    rol = nuevoRol
  }
  method potencialOfensivo() = (fuerza * 10) + rol.extraOfensivo(self)
  method esGroso() = self.esInteligente() or self.grosoEnRol()
  method esInteligente()
  method grosoEnRol() = rol.esGroso(self)
  method esOrco()
  method esHumano()
}

class Orco inherits Personaje {
  override method esOrco() = true
  override method esHumano() = false 
  override method esInteligente() = false
  override method potencialOfensivo() = super() * 1.1
}

class Humano inherits Personaje {
  override method esHumano() = true
  override method esOrco() = false
  override method esInteligente() = inteligencia > 50
} 

// ROLES
object guerrero {
  method extraOfensivo(personaje) = 100
  method esGroso(personaje) = personaje.fuerza() > 50
}

object cazador {
  var mascota = null
  method cambiarMascota(nuevaMascota) {
    mascota = nuevaMascota
  }
  method mascota() = mascota
  method extraOfensivo(personaje) = mascota.potencialOfensivo()
  method esGroso(personaje) = mascota.esLongevo()
}

object brujo {
  method extraOfensivo(personaje) = 0
  method esGroso(personaje) = true
} 

// MASCOTA
class Mascota {
  var edad
  var fuerza
  var tieneGarras
  method fuerza() = fuerza
  method edad() = edad
  method tieneGarras() = tieneGarras
  method cambiarFuerza(nuevaFuerza) {
    fuerza = nuevaFuerza
  }
  method crecer(nuevaEdad) {
    edad = nuevaEdad
  }
  method perderGarras() {
    tieneGarras = false
  }
  method ganarGarras() {
    tieneGarras = true
  }
  method esLongevo() = edad > 10
  method potencialOfensivo() {
    if (tieneGarras) {
      return fuerza * 2
    } else {
      return fuerza
    }
  }
}