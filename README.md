# Introduction
Example of github codespace for the use of [waterproof-vscode](https://github.com/impermeable/waterproof-vscode/).

To run it click the green "Code" button at the top of the page, select "Codespaces", and click the "+" button.

# Config
The configuration of the codespace depends on two files, found under the `.devcontainer` folder:
```bash
.
├── .devcontainer/
│   ├── codespace.Dockerfile
│   └── devcontainer.json
└── waterproof_tutorial.mv
```

The `waterproof_tutorial.mv` file is simply an example file to edit.

The `codespace.Dockerfile` defines the docker container for the codespace, which handles the dependencies (`coq`, `coq-waterproof` and `coq-lsp`).

The `devcontainer.json` file defines some basic things like the codespace name, where to find the docker file, the vscode extensions to include 
(in this case the `waterproof` extension), and quite importantly sets the `coq-lsp` binary path in vscode.
