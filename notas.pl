#!/usr/bin/perl
print "Content-Type: text/html\n\n";
if($ENV{'QUERY_STRING'} eq "") {
   print "<h1>Elige entre los posibles valores de shell</h1>
          <h3>Dime el prefijo de la asignatura</h3>
          <form name=\"search\">";
          print "<input type=\"text\" name=\"prefijo\">";
          print "<input type=\"submit\" value\"Buscar\" />";
}else {
  open T, "/home/usuario/notas.txt";
  while(<T>) {
  chomp;
  @campos=split(":");
  @campo1=split("=",$ENV{'QUERY_STRING'});
  if($campo1[1] eq $campos[0])
  {
   print "El alumno $campos[2] tiene un $campos[1] en $campos[0]<br>";
  }
  }
}
