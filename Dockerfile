FROM rustlang/rust:nightly AS builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y git bash make gcc linux-libc-dev patch musl musl-tools musl-dev

RUN rustup target add x86_64-unknown-linux-musl

COPY . /rumble-build

WORKDIR /rumble-build

RUN --mount=type=cache,target=/usr/local/cargo,from=rust,source=/usr/local/cargo \
    --mount=type=cache,target=target \
    cargo build --release --target x86_64-unknown-linux-musl && cp target/x86_64-unknown-linux-musl/release/rust-mumble /rust-mumble

FROM alpine:latest

COPY --from=builder /rust-mumble /rust-mumble
COPY .github/docker/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENV RUST_LOG=info

ENTRYPOINT ["/entrypoint.sh"]