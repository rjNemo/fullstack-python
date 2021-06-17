# Development server running on HTTPS

First install `mkcert` to self-sign certificate and manage them. On macOS type

```bash
brew install mkcert
mkcert -install
mkcert localhost 127.0.0.1 ::1
```

It will generate 2 files, a certificate at `localhost+x.pem` and a key at `localhost+x-key.pem`. Feel free to rename
these files as you wish.

Then run `uvicorn` server using:

```python
import uvicorn

uvicorn.run(
    "app.main:app",  # application name
    host="127.0.0.1",
    port=9000,
    reload="True",  # auto reload in development
    ssl_keyfile="./key.pem",
    ssl_certfile="./cert.pem",
)
```

Start the server and voilà

```bash
INFO:     Uvicorn running on https://127.0.0.1:9000 (Press CTRL+C to quit)
```