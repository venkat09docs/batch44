resource "null_resource" "local_commands"{
  provisioner "local-exec" {
    command = "ls -l"
  }
  provisioner "local-exec"{
    command = "pwd"
  }
}
