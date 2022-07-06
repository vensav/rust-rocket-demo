# rocket-web

A demonstration of Rocket Web framework using Rust

[Refer Rocket Doc](https://github.com/SergioBenitez/Rocket/tree/master/examples/hello)

[Rocket.toml config](https://docs.rs/rocket/0.5.0-rc.2/rocket/config/index.html)


## Version Used for testing
- Rust 1.62
- Rocket 0.5.0-rc.2


## Build and Run

``` shell script
# Development Run (port 8000)
cargo new rocket-web --bin
rustup override set stable
cargo build
cargo run

# Production Run (port 9000)
export ROCKET_SECRET_KEY=lnVZ0eYWiKvhVNsWmLHR2jgdMQjq69CRW2jjpK+2ChA= 
ROCKET_PROFILE=live cargo build --release
ROCKET_PROFILE=live cargo run --release
```

```
docker build . -t rocket-web:latest
docker run -i --rm -p 8000:8000 -p 9000:9000 rocket-web:latest
docker run -d -p 8000:8000 -p 9000:9000 rocket-web:latest
```


## Stats

### Build time
```
[+] Building 238.9s (15/15) FINISHED                            
 => [internal] load build definition from Dockerfile       0.0s
 => => transferring dockerfile: 37B                        0.0s
 => [internal] load .dockerignore                          0.0s
 => => transferring context: 2B                            0.0s
 => [internal] load metadata for docker.io/library/debian:buster-slim 1.4s
 => [internal] load metadata for docker.io/library/rust:1.62 1.4s
 => [internal] load build context                          0.0s
 => => transferring context: 2.31kB                        0.0s
 => [runtime 1/4] FROM docker.io/library/debian:buster-slim@sha256:7e9b444ed3453d940c91dde1ea883d1cb68c356fe8206fcc046dd2ab73431982 0.0s
 => [builder 1/5] FROM docker.io/library/rust:1.62@sha256:8220e4fbb22a07b78e6472cdf8f5fb8913a04974c26b130177b73a8a64334541          0.0s
 => CACHED [builder 2/5] WORKDIR /usr/src/rocket-web       0.0s
 => [builder 3/5] COPY src /usr/src/rocket-web/src         0.0s
 => [builder 4/5] COPY Cargo.toml Cargo.lock Rocket.toml ./                                                                         0.0s
 => [builder 5/5] RUN cargo install --path .             237.0s
 => CACHED [runtime 2/4] WORKDIR /app                      0.0s 
 => [runtime 3/4] COPY --from=builder /usr/local/cargo/bin/rocket-web .                                                             0.1s 
 => [runtime 4/4] COPY --from=builder /usr/src/rocket-web/Rocket.toml .                                                             0.0s 
 => exporting to image                                     0.1s 
 => => exporting layers                                    0.1s 
 => => writing image sha256:ac027ec075c675e185911b0725e05b34ceadd7a1287c13cb89e2d39bbeb39af4                                        0.0s 
 => => naming to docker.io/library/rocket-web:latest       0.0s                                                                                                                                                 
```

### Docker Image Size
```
rocket-web	IN USE	latest	ac027ec075c6	1 minute ago	78.21 MB
```

### Startup Times
- Boot Time: 0.06 secs
- Avg API response times: 16 ms
