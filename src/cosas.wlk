import camion.*

//pesa 500 kilos y su nivel de peligrosidad es 10.
object knightRider {
        method peso() = 500
        method peligrosidad() = 10
}
/*pesa 800 kilos y su nivel de peligrosidad es 15 si está transformado 
en auto o 30 si está como robot. */
object bumblebee {
        var property auto = true
        method peso() = 800
        method peligrosidad() =
                if (auto)  15
                else 30
        }

/*cada ladrillo pesa 2 kilos, la cantidad de ladrillos que tiene puede
variar. La peligrosidad es 2.*/
object paqueteLadrillos{
        var property cantidadDeLadrillos = 0
        method peso() {
                return cantidadDeLadrillos * 2
                }
        method peligrosidad() = 2
}

//el peso es variable, la peligrosidad es 1.
object arena {
        var property peso = 0
        method peligrosidad() = 1
}

/*el peso es 300 kilos si está con los misiles o 200 en otro caso.
En cuanto a la peligrosidad es 100 si está con los misiles y 0 en otro caso.*/
object bateriaAntiarea {
        var property misiles = true
        method peso() {
                if (misiles) return 300
                else return 200
        }
        method peligrosidad() {
                if(misiles) return 100
                else  return 0
        }
}

//Contenedor portuario: un contenedor puede tener otras cosas adentro.
//El peso es 100 + la suma de todas las cosas que estan adentro.
// Es tan peligroso como el objeto más peligroso que contiene. Si está vacío, su peligrosidad es 0.
object contenedor {
        const carga = []
        method cargar(cosa) {
                carga.addAll(cosa)
        }
        method peso() = carga.size() + 100
        method peligrosidad() = 
        carga.max({objeto => objeto.objetosMasPeligrososQue(carga)})
}

//el peso es variable y su peligrosidad es 200.
object residuosRadioactivos {
        var property peso = 0
        method peso() = peso
        method peligrosidad() = 200
}

//es una cobertura que envuelve a cualquier otra cosa.
// El peso es el peso de la cosa que tiene adentro.
//El nivel de peligrosidad es la mitad del nivel de peligrosidad de lo que envuelve.
object embalajeSeguridad {
        var property embalaje = self
        method peso() = embalaje.peso()
        method peligrosidad() = embalaje.peligrosidad() / 2

}