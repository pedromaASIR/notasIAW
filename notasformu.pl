#!/usr/bin/perl
print "Content-Type: text/html\n\n";
if($ENV{'QUERY_STRING'} eq "") {
   print "<h1>Dime tu nombre</h1>
          <form name=\"search\">";
          print "<input type=\"text\" name=\"nombre\">";
          print "<input type=\"submit\" value=\"Enviar Nombre\" />";
}
else
{
    @nombre=split("=",$ENV{'QUERY_STRING'});
    $nom=$nombre[1];
    print "el nombre es: $nom";
    print "<h3>Dime el prefijo de la asignatura</h3>
    <form name=\"search\">";
    print "<input type=\"text\" name=\"asignatura\">";
    print "<input type=\"submit\" value=\"Enviar asignatura\"/>";
}

{
  @campo1=split("=",$ENV{'QUERY_STRING'});
  if($campo1[0] eq "asignatura"){
  #Aqui contesta al formulario para mostrar solo
  open F, "/home/usuario/notas.txt";
  while(<F>) {
    chomp;
    @campos=split(":");
    if($campo1[1] eq $campos[0])
      {
        print "El alumno $campos[2] tiene un $campos[1] en $campos[0] y es elegido por $nom<br>";
      }
    }
  }
}