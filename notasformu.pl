#!/usr/bin/perl
print "Content-Type: text/html\n\n";
if($ENV{'QUERY_STRING'} eq "") {
   print "<h1>Dime tu nombre</h1> <form name=\"search\">";
          print "<input type=\"text\" name=\"nombre\">";
          print "<input type=\"submit\" value=\"Enviar Nombre\" />";
}
else
{
    @ar=split("=",$ENV{'QUERY_STRING'});
    if ($ar[0] eq 'nombre') {
       $profesor=$ar[1];
      # -------------------------------------------------------
      # Aqui averiguo cual es el prefijo que me viene, para 
      # sabers i es un nombre o una asignatura
      # presento como respuesta el formulario para que me 
      # introduzca una asignatura
      # -------------------------------------------------------
       print "<h3>Hola $profesor dime el prefijo de la asignatura</h3> <form name=\"search\">";
       print "<input type=\"text\" name=\"asignatura\">";
       print "<input type=\"submit\" value=\"Enviar asignatura\"/>";
    }

    if ($ar[0] eq 'asignatura') {
      # -------------------------------------------------------
      # Si el prefijo que me viene es una asignatura
      # muestro el contenido del fichero siempre que coincida
      # con la asignatura introducida.
      # -------------------------------------------------------
      # ¡¡OJO!! Cambia esta linea si tu nombre de usuario no es USUARIO
      open F, "/home/usuario/notas.txt";
      while(<F>) {
      chomp;
      @campos=split(":");
      if($ar[1] eq $campos[0])
      {
        print "El alumno: $campos[2] tiene un: $campos[1] en: $campos[0] y la busqueda la ha realizado: $profesor<br>";
      }
    }
  }
}

