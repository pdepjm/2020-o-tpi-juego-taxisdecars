import wollok.game.*
import objetos.*
import personajes.*


object keyConfig{
	method jugador1(personaje){
		keyboard.w().onPressDo({personaje.moverseA(personaje.position().up(1), arriba)})
		keyboard.s().onPressDo({personaje.moverseA(personaje.position().down(1), abajo)})
		keyboard.a().onPressDo({personaje.moverseA(personaje.position().left(1), izquierda)
			personaje.mirarIzquierda()
		})
		keyboard.d().onPressDo({personaje.moverseA(personaje.position().right(1), derecha)
			personaje.mirarDerecha()
		})
	}
	
	method jugador2(personaje){
		keyboard.up().onPressDo({personaje.moverseA(personaje.position().up(1), arriba)})
		keyboard.down().onPressDo({personaje.moverseA(personaje.position().down(1), abajo)})
		keyboard.left().onPressDo({personaje.moverseA(personaje.position().left(1), izquierda)
			personaje.mirarIzquierda()
		})
		keyboard.right().onPressDo({personaje.moverseA(personaje.position().right(1), derecha)})
			personaje.mirarDerecha()
	}
}

object aleatorio {
	var posicion = game.at(8, 8)

	method nuevaPosicion() {
		// calculo coordenadas aleatorias dentro la pantalla
		const x = 0.randomUpTo(game.width())
		const y = 0.randomUpTo(game.height())
		// cambio a nueva posicion
		return game.at(x, y)
	}
}

object spawner{
	method spawnMate(){
		game.addVisual(new Mate(posicion = aleatorio.nuevaPosicion()))
	}
	
	method spawnMateDorado(){
		game.addVisual(new MateDeOro(posicion = aleatorio.nuevaPosicion()))
	}
	
	method spawnAlfajor(){
		game.addVisual(new Alfajor(posicion = aleatorio.nuevaPosicion()))
	}
}

object arriba {
  method posicionEnEsaDireccion(jugador) = jugador.position().up(1)
}

object abajo {
  method posicionEnEsaDireccion(jugador) = jugador.position().down(1)
}

object izquierda {
  method posicionEnEsaDireccion(jugador) = jugador.position().left(1)
}

object derecha {
  method posicionEnEsaDireccion(jugador) = jugador.position().right(1)
}