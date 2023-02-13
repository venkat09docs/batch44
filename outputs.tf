output "webserver_public_ip-1" {
    value = aws_instance.webserver[0].public_ip
}

output "webserver_status-1" {
    value = aws_instance.webserver[0].instance_state
}

output "webserver_public_ip-2" {
    value = aws_instance.webserver[1].public_ip
}

output "webserver_status-2" {
    value = aws_instance.webserver[1].instance_state
}

output "webserver_public_ip-3" {
    value = aws_instance.webserver[2].public_ip
}

output "webserver_status-3" {
    value = aws_instance.webserver[2].instance_state
}
