resource "null_resource" "addfiles" {
    count = var.virtual_machine_count
    provisioner "file" {

        content = "<h1> this is a web server ${azurerm_linux_virtual_machine.appvm[count.index].computer_name}</h1>"

        destination = "/home/linuxadmin/Default.html"

        connection {
          type = "ssh"
          user = "linuxadmin"
          password = "Azure@123"
          host= var.vitual_machine_public_ip_address[count.index]
        }
      
    }

    provisioner "remote-exec" {

        connection {
          type = "ssh"
          user = "linuxadmin"
          password = "Azure@123"
          host= var.vitual_machine_public_ip_address[count.index]
        
        }

        inline = [      "sudo apt-get update -y",
      "sudo apt-get install -y nginx",

      # Move the custom HTML page to the NGINX directory
      "sudo mv /home/linuxadmin/Default.html /var/www/html/Default.html",

      # Ensure NGINX is running
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"]
    }
  
}