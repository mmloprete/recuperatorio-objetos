import src.ObjetosMagicos.*
class Mago {
    const objetosMagicos = []
    var poderInnato = 0
    var resistenciaMagica = 0 
    var energiaMagica = 0
    const nombre
    var categoria
   
    method poderTotal() = objetosMagicos.map({unObjeto => unObjeto.poderMagico(self)}).sum() * self.devolverSiEsPosibleElPoderInnato()

    method devolverSiEsPosibleElPoderInnato(){
        if(poderInnato.between(1, 10)){
            return poderInnato
        }
        else {
            throw new Exception(message = "El poder innato seteado es invalido!")
        }
    }
    //Acá podría crear un tipo de excepcion particular, pero no lo considero necesario.

    method cantidadDeLetrasEnElNombre() = nombre.size()


    method sumarEnergiaMagica(unaEnergia){
        energiaMagica += unaEnergia
    }

    method restarEnergiaMagica(unaEnergia){
        energiaMagica -= unaEnergia 
    }
    //Accessors
    method resistenciaMagica() = resistenciaMagica
    method energiaMagica() = energiaMagica
    method energiaMagica(unaEnergia){
        energiaMagica = unaEnergia
    } 
    method categoria() = categoria

}

object magoAprendiz {
    //esVencido me devuelve la cantidad de puntos que pierde un mago ante otro
    method esVencido(unMago, otroMago){
        if(unMago.resistenciaMagica() < otroMago.poderTotal()){
            return unMago.energiaMagica() * 0.5 
        }
        else {
            return 0
        }
    }
}

object magoVeterano {
    method esVencido(unMago,otroMago){
        if(otroMago.poderTotal() >= 1.5 * unMago.resistenciaMagica()){
            return unMago.energiaMagica() * 0.25
        }
        else{
            return 0
        }
    }
}

object magoInmortal{
    method esVencido(unMago, otroMago){
        return 0
    }
}

object batalla{
    method desafia(unMago, otroMago){
        const energiaTransferida = otroMago.categoria().esVencido(otroMago, unMago)
        unMago.sumarEnergiaMagica(energiaTransferida)
        otroMago.restarEnergiaMagica(energiaTransferida)
    }
}

class Gremio {
    const miembros = #{}

    method poderTotal(){
        return miembros.map({unMago => unMago.poderTotal()}).sum()
    }

    method nuevoMiembro(unMago){
        miembros.add(unMago)
    }
}