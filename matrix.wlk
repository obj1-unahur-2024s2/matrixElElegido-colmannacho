object nave {
  const property pasajeros = [neo,morfeo,trinity]
  method subirA(unPasajero) {
    pasajeros.add(unPasajero)
  }
  method bajarA(unPasajero) {
    pasajeros.remove(unPasajero)
  }
  method cantidadPasajeros() = pasajeros.size()
  method mayorVitalidad() = pasajeros.max({e => e.vitalidad()})
  method estaEquilibrada() {
    return
    self.mayorVitalidad().vitalidad() >= 2 * self.menorVitalidad().vitalidad()
  }
  method menorVitalidad() = pasajeros.min({e => e.vitalidad()})
  method estaElElegido() = pasajeros.any({c => c.esElElegido() }) 
  method chocar() {
    pasajeros.forEach({p => p.saltar() self.bajarA(p)})
  }
  method acelerar() {
    self.pasajerosSinElegido().forEach({p => p.saltar()})
  }
  method pasajerosSinElegido() = pasajeros.filter({p => not p.esElElegido()}) 
}
object neo {
  method esElElegido() = true
  var energia = 100
  method vitalidad() = energia/10 
  method saltar() {
    energia = energia * 0.5
  }
}
object morfeo {
  method esElElegido() = false
  var vitalidad = 8
  var estaCansado = false
  method estaCansado() = estaCansado
  method vitalidad() = vitalidad 
  method saltar() {
    vitalidad = 0.max(vitalidad - 1)
    estaCansado = not estaCansado
  }
}
object trinity {
  method esElElegido() = false
  const property vitalidad = 0
  method saltar() {}
}