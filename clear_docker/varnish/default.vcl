vcl 4.0;

backend default {
    .host = "nginx";
    .port = "80";
}

sub vcl_recv {
    if (req.method == "PURGE") {
        return (purge);
    }
}
