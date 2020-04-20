files  = [
	"deploy/service.nomad",
]

step "run" {
	file = "service.nomad"
}
