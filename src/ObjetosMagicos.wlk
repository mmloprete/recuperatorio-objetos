class ObjetoMagico {
    var valorBaseDePoder = 100

    method poderMagico(unMago) 
}
//Esto no es una clase abstracta, por eso la heredo, simplemente adjunto poderMagico(unMago)
//por polimorfismo

class Varita inherits ObjetoMagico{
    override method poderMagico(unMago) = if(unMago.cantidadDeLetrasEnElNombre().even()) valorBaseDePoder * 1.5 else valorBaseDePoder
}

class Tunica inherits ObjetoMagico{
    override method poderMagico(unMago){
        return unMago.resistenciaMagica() * 2        
    }
}

class TunicaEpica inherits Tunica{
    override method poderMagico(unMago){
        return super(unMago) + 10
    }
}

class Amuleto inherits ObjetoMagico{
    override method poderMagico(unMago){
        return 200
    }
}

object ojota inherits ObjetoMagico{
  override method poderMagico(unMago){
    return unMago.cantidadDeLetrasEnElNombre() * 10
  }
}