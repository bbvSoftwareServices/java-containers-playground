package eu.bbv.javacontainers;

import com.sun.net.httpserver.HttpServer;

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.time.Instant;

public class SimpleWebServer {

    public static void main(String[] args) {
        try {
            // This api is actually "supported": https://inside.java/2021/12/06/working-with-the-simple-web-server/
            HttpServer server = HttpServer.create(new InetSocketAddress( 8080), 0);
            server.createContext("/hello", httpExchange -> {
                var response = createResponse();
                httpExchange.getResponseHeaders().add("content-type", "application/json");
                httpExchange.sendResponseHeaders(200, response.getBytes().length);
                try (OutputStream os = httpExchange.getResponseBody()) {
                    os.write(response.getBytes());
                }
            });

            Runtime.getRuntime().addShutdownHook( new Thread( () -> {
                System.out.println("Stopping Server");
                server.stop(1);
            }));

            new Thread(server::start).start();
            System.out.println("Server started on " + server.getAddress());
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }

    private static String createResponse() {
        return String.format("""
                {
                    "message: "Hello at %s"
                }
                """, Instant.now());
    }
}
