import cosas.*

object camion {
        const   carga = []
        const   descarga = []

        method cargar(cosa) {
                carga.addAll(cosa)
        }
        method descargar(cosa){
                descarga.remove(cosa)
        }

        //si el peso de cada uno de los objetos cargados es un número par.
        method todoPesoPar() =
                carga.all({ objeto => objeto.peso().even()})


        /*indica si hay alguno de los objetos cargados que tiene exactamente
		el peso indicado.*/
        method hayAlgunoQuePesa(peso) =
                carga.any({pesa => pesa.peso() == peso})

        /*devuelve el primer objeto cargado que encuentre, cuyo nivel de
		peligrosidad coincida exactamente con el valor indicado.*/
        method elDeNivel(nivel) =
                carga.any({peligrosidad => peligrosidad.peligrosidad() == nivel })

        /*es la suma del peso del camión vacío (tara) y su carga. La tara del
		camión es de 1000 kilos.*/
        method pesoTotal() =
                 carga.sum( {peso => peso.peso()}) + 1000
        
        //indica si el peso total es superior al peso máximo, que es de 2500 kilos.
        method excedidoDePeso() =
                 self.pesoTotal() > 2500
        
        /*devuelve una colección con los objetos cargados que superan el
		nivel de peligrosidad indicado*/
        method objetosQueSuperanPeligrosidad(nivel) =
                carga.filter({peligro => peligro.peligrosidad() > nivel })

        /*devuelve una colección con los objetos cargados que son más
		peligrosos que la cosa indicada*/
        method objetosMasPeligrososQue(cosa) =
                carga.filter({ objeto => objeto.peligrosidad() > cosa.peligrosidad()})
        
        /*Puede circular si no está excedido de peso,
         y además, ninguno de los objetos cargados supera el nivel máximo
		de peligrosidad indicado.*/
        method puedeCircularEnRuta(nivelMaximoPeligrosidad) =
                !self.excedidoDePeso() and
                carga.max({objeto => objeto.peligrosidad()}).peligrosidad() < nivelMaximoPeligrosidad


        /*indica si el peso de alguna de las cosas que tiene el camión está
		en ese intervalo*/
        method tieneAlgoQuePesaEntre(min, max)=
                self.pesos().beetween (min,max)

                
		/*la cosa más pesada que tenga el camión. Ojo que lo que se pide es
		la cosa y no su peso*/
        method cosaMasPesada()=
                carga.max({ cosa => cosa.peso() })
                
        //devuelve una lista con los pesos de cada cosa que tiene el camión.
        method pesos()=        
                 carga.map({ peso => peso}).peso()
        
}