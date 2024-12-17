resource "aws_instance" "db_server" {
  ami                    = " " //ami id
  instance_type          = "t2.micro"
  key_name               = "mumbai_aft"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  tags = {
    Name = "DB-Server"
  }
}
