# Java Dev Container to work with VSCode Java Development

This repository provides a development container for Java projects using Visual Studio Code. It includes all the necessary tools and configurations to set up a consistent and efficient development environment.

## Features

- Pre-configured Java Development Kit (JDK)
- Maven for dependency management
- Pre-installed VS Code extensions for Java development
- Docker-based containerization for a consistent environment

## Getting Started

### Prerequisites

- Docker installed on your machine
- Visual Studio Code with the Remote - Containers extension

### Setup

1. Clone this repository:
    ```sh
    git clone https://github.com/Amrish-Sharma/javaDevContainer.git
    ```
2. Open the repository in Visual Studio Code:
    ```sh
    code javaDevContainer
    ```
3. Open the Command Palette (F1) and select `Remote-Containers: Open Folder in Container`.

VS Code will build the container and start your development environment inside it.

### Using the Dev Container

- The container includes the JDK and Maven, so you can run Java applications and manage dependencies directly inside the container.
- Any changes to the source code will be reflected in the container.

### Customization

You can customize the dev container by modifying the `devcontainer.json` file and the Dockerfile. For example, you can add additional tools, change the JDK version, or modify VS Code settings.

### Configuration

The `devcontainer.json` file is used to configure the development container. Here is a summary of its contents:

- **name**: The name of the development container.
- **build**: Specifies the Dockerfile used to build the container.
- **settings**: VS Code settings for the development container.
- **extensions**: List of VS Code extensions to be installed in the container.
- **postCreateCommand**: Command to be run after the container is created.
- **remoteUser**: The user to use in the container.
- **portsAttributes**: Port configuration for the container.

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
