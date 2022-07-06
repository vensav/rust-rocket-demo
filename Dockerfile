FROM rust:1.62 as builder


WORKDIR /usr/src/rocket-web
COPY src /usr/src/rocket-web/src
COPY Cargo.toml Cargo.lock Rocket.toml ./
RUN cargo install --path .


FROM debian:buster-slim as runtime
WORKDIR /app
COPY --from=builder /usr/local/cargo/bin/rocket-web .
COPY --from=builder /usr/src/rocket-web/Rocket.toml .
#ENV ROCKET_PROFILE=debug
ENV ROCKET_PROFILE=live
ENV ROCKET_SECRET_KEY=lnVZ0eYWiKvhVNsWmLHR2jgdMQjq69CRW2jjpK+2ChA=
EXPOSE 8000 9000
CMD ["./rocket-web"]
