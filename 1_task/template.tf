resource "aws_launch_template" "app_launch_template" {
  name          = "app-launch-template"
  image_id      = " " //ami id
  instance_type = "t2.micro"
  key_name      = "mumbai_aft"

  vpc_security_group_ids = [aws_security_group.app_sg.id]

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = aws_subnet.public.id
  }

  user_data = base64encode(data.template_file.app_user_data.rendered)

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "App-Server"
    }
  }
}

resource "aws_launch_template" "db_launch_template" {
  name          = "db-launch-template"
  image_id      = " "//ami id
  instance_type = "t2.micro"
  key_name      = "mumbai_aft"

  vpc_security_group_ids = [aws_security_group.db_sg.id]

  network_interfaces {
    subnet_id = aws_subnet.private.id
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "DB-Server"
    }
  }
}
