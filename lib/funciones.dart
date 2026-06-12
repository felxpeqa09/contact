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
  stdout.write("-----------BUSCAR CONTACTO POR NOMBRE-----------");
  stdout.writeln("Ingrese nombre del contacto a buscar. ");
  String nombreBuscado = stdin.readLineSync()?? "";
if(nombreBuscado.isEmpty){
  stdout.writeln("El nombre no puede estar vacío. Por favor, ingrese un nombre válido.");
  return;
}
for(var contacto in contactos){
  if(contacto["nombre"].toString().toLowerCase()==nombreBuscado.toLowerCase()){
    stdout.writeln("Id: ${contacto["id"]}");
    stdout.writeln("Nombre: ${contacto["nombre"]}");
    stdout.writeln("Telefono: ${contacto["telefono"]}");  
    stdout.writeln("Correo: ${contacto["correo"]}");
    stdout.writeln("Ciudad: ${contacto["ciudad"]}");
  }
  else {
    stdout.writeln("No se encontró ningún contacto con el nombre '$nombreBuscado'.");
  }
}


}
