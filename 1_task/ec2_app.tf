resource "aws_instance" "app_server" {
  ami                    = " " //ami id
  instance_type          = "t2.micro"
  key_name               = "mumbai_aft"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  user_data              = data.template_file.app_user_data.rendered
  tags = {
    Name = "App-Server"
  }
}