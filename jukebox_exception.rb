# assuming socket and opfile_name are already set up

op_file = File.open(opfile_name, "w")
begin
  # Exceptions raised by this code will
  # be caught by the following rescue clause
  while data = socket.read(512)
    op_file.write(data)
  end
  
  rescue SystemCallError
    $stderr.print "IO failed: " + $!
    op_file.close
    File.delete(opfile_name)
    raise
  end