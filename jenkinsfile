pipeline {

  // Define the agent to execute the pipeline on
  agent any

  // Set environment variables used throughout the pipeline
  environment {
    DOCKER_IMAGE_NAME = 'calculator'
    GITHUB_REPO_URL = 'https://github.com/Aryan9626/calculator.git'
  }

  // Stages of the pipeline execution
  stages {

    // =========== 1. Checkout Stage ===========

    stage('Checkout') {
      steps {
        script {
          // Retrieve the code from the specified Git repository
          echo 'Checking out code from the Git repository...'
          git branch: 'main', url: "${GITHUB_REPO_URL}"
        }
      }
    }

    // =========== 2. Build Docker Image Stage ===========

    stage('Build Docker Image') {
      steps {
        script {
          // Build the Docker image using the Dockerfile in the current directory
          echo 'Building Docker image...'
          docker.build("${DOCKER_IMAGE_NAME}", '.')
        }
      }
    }

    // =========== 3. Push Docker Image Stage ===========

    stage('Push Docker Images') {
      steps {
        script {
          // Define registry credentials and tag the image with a specific name
          echo 'Tagging and pushing Docker image to Docker Hub...'
          docker.withRegistry('', 'DockerHubCred') {
            sh 'docker tag calculator iiitb/calculator:latest'
            sh 'docker push iiitb/calculator'
          }
        }
      }
    }

    // =========== 4. Run Ansible Playbook Stage ===========

    stage('Run Ansible Playbook') {
      steps {
        script {
          // Execute the Ansible playbook with the specified inventory file
          echo 'Running Ansible playbook to deploy the application...'
          ansiblePlaybook(
            playbook: 'deploy.yml',
            inventory: 'inventory'
          )
        }
      }
    }
  }
}
