probe std_probe {
	.url = "/index.php";
	.interval = 5s;
	.timeout = 1s;
	.window = 5;
	.threshold = 3;
}

backend default {
	.host = "backend";
	.probe = std_probe;
}

sub vcl_recv {
	return (pass);
}

acl purge {
	"localhost";
	"127.0.0.1";
	"127.17.0.1";
}

# Puoi anche aggiungere delle callback che verranno eseguite **prima** di quelle presenti in default.vcl
# sub vcl_recv {
#}


