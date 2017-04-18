Per potere utilizzare questa configurazione di varnish:

* Crea il file local.vcl con un contenuto tipo


    probe std_probe {
        .url = "/index.html";
        .interval = 5s;
        .timeout = 1s;
        .window = 5;
        .threshold = 3;
     }

     backend default {
        .host = "backend";
        .probe = std_probe;
     }

     acl purge {
        "localhost";
        "127.17.0.1";
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

* Crea il file secret con il comando ```dbus-uuidgen > secret && chmod 0600 secret```
