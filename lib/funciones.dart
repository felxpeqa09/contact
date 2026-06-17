import 'dart:io';

void registrarContacto(List<Map<String,dynamic>> contactos){
  stdout.writeln("-----------REGISTRAR CONTACTO-----------");
  String continuar = "s";
  int id =1;
  
  while(continuar=="s"){
    try{
    stdout.writeln("Nombre contacto: ");
    String nombre = stdin.readLineSync()?? "";
    stdout.writeln("Telefono:");
    int numeroTelefono = int.tryParse(stdin.readLineSync()?? "")??0 ;
    stdout.writeln("Correo");
    String correo = stdin.readLineSync()?? "";
    stdout.writeln("Ciudad");
    String ciudad = stdin.readLineSync()?? "";
    contactos.add({
      "id":id++,
      "nombre": nombre,
      "telefono": numeroTelefono,
      "correo": correo,
      "ciudad": ciudad
    });
    stdout.writeln("Desea registrar otro contacto? (s/n)");
    continuar = stdin.readLineSync()?? "";
    }on FormatException {
      stdout.writeln("Entrada inválida. Por favor, ingrese un número válido.");
    }
  }
}

void mostarContactos(List<Map<String,dynamic>>contactos){
  stdout.writeln("-----------MOSTRAR CONTACTOS-----------");
  if(contactos.isEmpty){
    stdout.writeln("No hay contactos registrados. ");
  }
  for(var contactos in contactos){
    stdout.writeln("Id: ${contactos["id"]}");
    stdout.writeln("Nombre: ${contactos["nombre"]}");
    stdout.writeln("Telefono: ${contactos["telefono"]}");  
    stdout.writeln("Correo: ${contactos["correo"]}");
    stdout.writeln("Ciudad: ${contactos["ciudad"]}");  
  }
}

void buscarContactoPorNombre(List<Map<String,dynamic>> contactos){
  stdout.writeln("-----------BUSCAR CONTACTO POR NOMBRE-----------");
  stdout.writeln("Ingrese nombre del contacto a buscar. ");
  String nombreBuscado = stdin.readLineSync()?? "";
if(nombreBuscado.isEmpty){
  stdout.writeln("El nombre no puede estar vacío. Por favor, ingrese un nombre válido.");
  return;
}
bool encontrado = false;
for(var contacto in contactos){
  if(contacto["nombre"].toString().toLowerCase()==nombreBuscado.toLowerCase()){
    stdout.writeln("Id: ${contacto["id"]}");
    stdout.writeln("Nombre: ${contacto["nombre"]}");
    stdout.writeln("Telefono: ${contacto["telefono"]}");  
    stdout.writeln("Correo: ${contacto["correo"]}");
    stdout.writeln("Ciudad: ${contacto["ciudad"]}");
    encontrado = true ;
  }
}
if (!encontrado){
  stdout.writeln("No se encontró ningún contacto con el nombre '$nombreBuscado'.");
}

}
void buscarContactoPorCiudad(List<Map<String,dynamic>> contactos){
  stdout.writeln("-----------BUSCAR CONTACTO POR CIUDAD-----------");
  stdout.writeln("Ingrese nombre de la ciudad:  ");
  String ciudadBuscada = stdin.readLineSync()?? "";
  if(ciudadBuscada.isEmpty){
    stdout.writeln("la ciudad buscada no puede esta vacia . por favor ingrese una ciudad ");
    return;
  }
  bool encontrado = false;
  for (var contacto in contactos){
    if(contacto["ciudad"].toString().toLowerCase()==ciudadBuscada.toLowerCase()){
    stdout.writeln("------------------");
    stdout.writeln("Id: ${contacto["id"]}");
    stdout.writeln("Nombre: ${contacto["nombre"]}");
    stdout.writeln("Telefono: ${contacto["telefono"]}");  
    stdout.writeln("Correo: ${contacto["correo"]}");
    stdout.writeln("Ciudad: ${contacto["ciudad"]}");
    stdout.writeln("------------------");
    
    encontrado = true ;
    }
    if(!encontrado){
      stdout.writeln("No se encontro ningun contacto registrado con esta ciudad");
    }

  }
}

void actualizarTelefono (List<Map<String,dynamic>> contactos){
  stdout.writeln("---------ACTUALIZAR TELEFONO---------");
  int idBuscado  ;
  try {
    stdout.writeln("Ingrese id del telefono a actualizar");
    idBuscado = int.parse(stdin.readLineSync()!);
  }on FormatException {
    print("Entrada invalida. debe ingresar un dato tipo entero");
    return ;
  }
  for(var contacto in contactos){
    int numeroTelefonoNuevo ;
    if(contacto["id"] == idBuscado){
      stdout.writeln("Id ${contacto["id"]}");
      stdout.writeln("Nombre ${contacto["nombre"]}");
      stdout.writeln("Telefono ${contacto["telefono"]}");
      stdout.writeln("Correo ${contacto["correo"]}");
      stdout.writeln("Ciudad ${contacto["ciudad"]}");
      stdout.writeln("-------INGRESE EL NUMERO NUEVO------");
      try{
        numeroTelefonoNuevo = int.parse(stdin.readLineSync()!);
        contacto["telefono"] = numeroTelefonoNuevo;
      }on FormatException{
        stdout.writeln("Entrada invalida. debe ingresar un dato tipo entero");
        return;
      }
    }else {
      stdout.writeln("No existe contacto registrado con ese id");
    }
  }

}
void eliminarContacto(List<Map<String,dynamic>> contactos){
  int idBuscado;
  stdout.writeln("-------ELIMINAR CONTACTO-------");
  try{
    stdout.writeln("Ingrese id de contacto a eliminar");
    idBuscado = int.parse(stdin.readLineSync()!);
  }on FormatException{
    stdout.writeln("Entrada invalidada. debe ingresar un dato tipo entero");
    return;
  }
  contactos.removeWhere((contacto)=> contacto["id"]== idBuscado
  );

}
void numeroContactosExistentes (List<Map<String,dynamic>> contactos){
  stdout.writeln("-----------NUMEROS CONTACTOS EXISTENTES--------");
  stdout.writeln("Hay ${contactos.length} numeros registrados ");

}
void mostrarAlfabeticamente(List<Map<String,dynamic>> contactos){
  contactos.sort(
    (a,b) =>(a["nombre"].toString().compareTo(b["nombre"].toString()))
  );
  for(var contacto in contactos ){
    stdout.writeln("Id ${contacto["id"]}");
    stdout.writeln("Nombre ${contacto["nombre"]}");
    stdout.writeln("Telefono ${contacto["telefono"]}");
    stdout.writeln("Correo ${contacto["correo"]}");
    stdout.writeln("Ciudad ${contacto["ciudad"]}");
  }
}