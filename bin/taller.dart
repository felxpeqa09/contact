import 'dart:io';

import 'package:taller/funciones.dart';
void main(List<String>arguments){
    List<Map<String,dynamic>> contactos =[];
    int opcion = 1;
    do {
      stdout.writeln("1. Agregar contacto");
      stdout.writeln("2. Mostar todos los contactos");
      stdout.writeln("3. Buscar contacto por nombre");
      stdout.writeln("4. Buscar contacto por ciudad");
      stdout.writeln("5. Actualizar telefono");
      stdout.writeln("6. Eiminar contacto)");
      stdout.writeln("7. Numero de contactos existentes");
      stdout.writeln("9. Mostrar contactos alfabeticamente");
      stdout.writeln("9. Salir");
      stdout.writeln("Ingrese una opcion: ");
      opcion = int.tryParse(stdin.readLineSync()??"")?? 0;
      switch(opcion){ 
        case 1:
          registrarContacto(contactos);
          break;
        case 2:
          mostarContactos(contactos);
          break;
        case 3:
          buscarContactoPorNombre(contactos);
          break;
        case 4:
          buscarContactoPorCiudad(contactos);
          break;
        case 5:



      }
    } while (opcion!=9);
}