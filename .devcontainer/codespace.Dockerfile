# Use an Ubuntu base image
FROM ubuntu:latest

# Install essential dependencies for building and installing opam
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    curl \
    ca-certificates \
    build-essential \
    git \
    libgmp-dev \
    pkg-config \
    opam && \
    # Clear cache
    rm -rf /var/lib/apt/lists/*

# Initialize opam and configure the environment
RUN opam init --disable-sandboxing --bare -y && \
    eval $(opam env) && \
    opam switch create waterproof 4.14.1+options -y && \
    eval $(opam env --switch=waterproof)

# Install Coq LSP and pin waterproof repository
RUN opam install coq-lsp.0.1.8+8.17 -y && \
    opam pin add https://github.com/impermeable/coq-waterproof.git#2.1.0+8.17 -y

# Ensure opam environment is properly set up for the default user
RUN eval $(opam env)
