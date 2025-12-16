##  Project Overview
This repository contains the setup for the Example Voting App, enhanced with DevOps best practices including CI/CD, Container Optimization, Infrastructure as Code, and Monitoring strategies.

## Features Added
1.  **CI Pipeline:**
    * Created a GitHub Actions workflow (`.github/workflows/ci.yml`) that triggers on Pull Requests to the `main` branch.
    * It automatically installs dependencies and runs tests for the Vote App.
2.  **Container Optimization:**
    * Utilized **Multi-stage builds** in `Dockerfile` to keep image sizes small.
    * Added `.dockerignore` to prevent unnecessary files from entering the container.
3.  **Infrastructure as Code (IaC):**
    * Included `main.tf` using **Terraform** (Docker Provider) to demonstrate how to provision infrastructure via code locally.
4.  **Monitoring Strategy:**
    * Designed a monitoring plan based on the **RED Method** (Rate, Errors, Duration).
    * See `monitoring_plan.md` for full details.

## 💻 How to Run Locally
Prerequisites: Docker & Docker Compose installed.

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/abraamsf/example-voting-app.git](https://github.com/abraamsf/example-voting-app.git)
    cd example-voting-app
    ```
2.  **Start the application:**
    ```bash
    docker-compose up -d --build
    ```
3.  **Access the App:**
    * Vote App: [http://localhost:8080](http://localhost:8080)
    * Result App: [http://localhost:8081](http://localhost:8081)


## Future Improvements
**Centralized Logging:** Implement ELK Stack or Loki to collect logs from all containers.