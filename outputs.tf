output "webserver_public_ip" {
    value = aws_instance.webserver.public_ip
}

output "webserver_status" {
    value = aws_instance.webserver.instance_state
}
