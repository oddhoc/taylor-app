files  = [
	"/myapp/deploy/service.nomad",
]

step "run" {
	file = "service.nomad"
}
