import wollok.game.*
import movimientos.*
import carpinchos.*
import objetos.*

class Personaje{
	const property esAtravesable = true
	var property estaCongelado = false
	
	var orientacion = derecha
	
	method image() = orientacion.imagenDelJugador(self)
	
	method puedeMoverAl(unaOrientacion) {
		if(self.estaCongelado()){
  			return false
  		}else return game.getObjectsIn(unaOrientacion.posicionEnEsaDireccion(self)).all {unObj => unObj.esAtravesable()}
	}
	method cambiarPosicion(posicion){}
	
	method moverseA(posicion, unaOrientacion){ 
    	orientacion = unaOrientacion 
    
    if(self.puedeMoverAl(unaOrientacion)){ 
      self.cambiarPosicion(posicion)
    } 
  }
  
  method imagenDerecha() = self.nombre() + " right.png"
  method imagenIzquierda() = self.nombre() + " left.png"
  
  method nombre() = ""
}

object carpincho inherits Personaje {
	var property position = game.at(4,8)
		
	const distanciaX = self.position().x() - yaguarete.position().x()
	const distanciaY = self.position().y() - yaguarete.position().y()
	
	override method nombre() = "carpincho"
	
	override method cambiarPosicion(posicion) {
		self.position(posicion)
	}
  
	method perdiste() = true
		
	method alejarseDeYaguarete(){
		if(distanciaX < 10 || distanciaY < 10){
			self.huirDeyaguarete()
		}
	}

	method huirDeyaguarete(){
		if(self.position().x() == yaguarete.position().x()){ 
			
		    if(yaguarete.position().y() > self.position().y()){
			 self.moverseA(self.position().down(1), abajo)} 
			
		       else{
			     self.moverseA(self.position().up(1), arriba)}
		  }else{
			
		      if(yaguarete.position().x() > self.position().x()){
			   self.moverseA(self.position().left(1), izquierda)
			   } 
			
		         else{
			      self.moverseA(self.position().right(1), derecha)
			      } 
	          }	
	}	
	
	method chocasteConYaguarete(){
		juegoCarpinchoGaucho.perderJuego()
	}
}

object yaguarete inherits Personaje  {
	var property position = game.at (1,1)
		
	override method nombre() = "yaguarete"
	
	override method cambiarPosicion(posicion) {
		self.position(posicion)
	}
	
	method perseguirCarpincho(){
		
     	if(self.position().x() == carpincho.position().x()){ 
			
		    if(carpincho.position().y() > self.position().y()){
			 self.moverseA(self.position().up(1), arriba)} 
			
		       else{
			     self.moverseA(self.position().down(1), abajo)}
		  }else{
			
		      if(carpincho.position().x() > self.position().x()){
			   self.moverseA(self.position().right(1), derecha)} 
			
		         else{
			      self.moverseA(self.position().left(1), izquierda)} 
	          }				
	}
	
	method chocasteConCarpincho(){
		juegoCarpinchoGaucho.perderJuego()	
	}
	
}



