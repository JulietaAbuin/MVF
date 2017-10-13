class Villano{
	var ejercito=[]
	var rayoCongelante10 = new Arma("rayo congelante",10)
	method ejercito(){return ejercito}
	method congelar(nvc,ciudad){
		var ejercito_congela = ejercito.filter({m => m.puedeCongelar(nvc)})
		ejercito_congela.forEach({m => m.alimentarse(10) m.sumarMaldad()})
		ciudad.bajarTemperatura(30)	
	}
	
	method robarPiramide(ciudad,altura){
		var ejercito_piramide = ejercito.filter({m => m.puedeRobarPiramide(altura/2)})
		ejercito_piramide.forEach({m=>m.alimentarse(10) m.sumarMaldad()})
		ciudad.restarPiramide()
}

	method robarSuero(ciudad){
		var ejercito_suero = ejercito.filter({minion => minion.puedeRobarSuero()})
		ejercito_suero.forEach({m=>m.tomarSueroMutante() m.sumarMaldad()})
		ciudad.restarSuero()
	}
	method robarLuna(ciudad){
		var ejercito_luna = ejercito.filter({m=>m.puedaRobarLuna()})
		ejercito_luna.forEach({minion =>minion.agregarArma(rayoCongelante10) minion.sumarMaldad()})
		ciudad.bajarTemperatura(15)
		ciudad.restarLuna()
	}
	method mejorMinion(){
	var mejor = (ejercito.map({m=>m.maldades()})).max()
	return ejercito.filter({m=>m.maldades()==mejor})
	}
	method minionsInutiles(){
		return ejercito.filter({m=>m.maldades()==0})
	}

	method nuevoMinion(minion){
		ejercito.add(minion)
	}
	method otorgarArma(minion,arma){
		minion.agregarArma(arma)
	}
	method alimentar(minion,_bananas){
		minion.alimentarse(_bananas)
	}
	method nivelDeConcentracion(minion){
		minion.concentracion()
	}
	method esPeligroso(minion){
		minion.peligroso()
	}
}

class Minion{
	var bananas
	var color = "amarillo"
	var armas=[]
	var maldades = 0
	
	constructor(_bananas,_arma){bananas=_bananas 
		armas.add(_arma)
	}
	method maldades(){return maldades}
	method poder(arma){
		arma.potencia()
	}

	method concentracion(){
		if(color=="amarillo"){
		return bananas+((armas.map({e => e.potencia()})).max())
		}else{ return bananas}}
	
	method peligroso(){
		if(color=="amarillo"){
		return armas.size()>2
		}else{
		return true
		}
	}
	method agregarArma(arma){
		armas.add(arma)
	}
	method tomarSueroMutante(){
		if(color=="amarillo"){
			color = "violeta"
			armas=[]
		}else{
			color="amarillo"
		}
		bananas-=1
	}
	method alimentarse(_bananas){
		bananas+= _bananas
	}

	method puedeCongelar(ndc){
		return ( self.concentracion()>ndc && armas.any({m => m.tipoDeArma()=="rayo congelante"}))
	}
	method puedeRobarPiramide(ndc){
		return (self.concentracion()>ndc && self.peligroso())
	}
	method puedeRobarSuero(){
		return( self.concentracion()>=23 && bananas>=100)
	}
	method puedeRobarLuna(){
		return armas.any({a => a.tipoDeArma()=="rayo encogedor"})
}
	method sumarMaldad(){
		maldades +=1
	}
	}

class Arma{
	var nombre =""
	var potencia 
	constructor(nombre_,potencia_){
		nombre = nombre_
		potencia = potencia_
	}
		method potencia(){return potencia}
		method tipoDeArma(){return nombre}
}

class Ciudad{
	var temperatura
	var posesiones=[suero,piramide,luna]
	constructor(temp){ temperatura = temp}
	method bajarTemperatura(n){
		temperatura -= n
	}
	method restar(objeto){
	if(!posesiones.contains(objeto)){
	throw new UserException("El objeto ya fue robado")
	}else{posesiones.remove(objeto)
			
	}}
		}
	object suero{}
	object piramide{}
	object luna{}
	
	class Robar{
		var ciudad
		var villano
		var objeto
		constructor(_ciudad,_villano,_objeto){
			ciudad=_ciudad
			villano=_villano
			objeto=_objeto
		}
	}

class UserException inherits Exception {
	constructor(mensaje){console.println(mensaje)}
}

/** 4)
a) Si esto sucediera, crearia clases segun los colores, y que ellas mismas pudieran cambiar su color y tendrian metodos distintos para tomar el
suero mutante segun su color. Si el minion es verde, pierde todas sus bananas, y se le agrega un arma rayo de envidia. 


b) si esto sucediera, verifico que si es amarillo, se modifiquen las armas y las bananas, y sino, no envio ningun mensaje
method tomarSueroMutante(){
		if(color=="amarillo"){
			color = "violeta"
			armas=[]
			bananas-=1
		}
		
	} */