#!/usr/bin/perl
print "Content-Type: text/html\n\n";
if($ENV{'QUERY_STRING'} eq "") {
# -------------------------------------------------
# Si el query string que nos viene es vacio, ya 
# que es la primera que es ejecutado, nos 
# mostrara este breve formulario
# -------------------------------------------------
   print "<h1>Hola, bienvenido a este script simple en perl</h1>
          <h3>Dime el prefijo de la asignatura</h3>
          <form name=\"search\">";
          print "<input type=\"text\" name=\"asignatura\">";
          print "<input type=\"submit\" value=\"enviar\" />";
}else {
# -------------------------------------------------
# En caso de que venga ya relleno el formulario,
# nos mostrara el resultado
# -------------------------------------------------
#Esta linea es la que debes modificar por si tu fichero no esta en /home/usuario/notas.txt, lo que hay entre comillas. 
  @campo1=split("=",$ENV{'QUERY_STRING'});
  open T, "/home/usuario/notas.txt";
  while(<T>) {
    chomp;
    @campos=split(":");
    if($campo1[1] eq $campos[0])
    {
      print "El alumno $campos[2] tiene un $campos[1] en $campos[0]<br>";
    }
  }
}
