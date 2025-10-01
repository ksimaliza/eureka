pipeline {
    agent any
   environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-creds' // Credenciales de Docker Hub en Jenkins
        DOCKERHUB_REPO = 'ksimaliza/servicio1'  // Cambia por tu repo
        IMAGE_TAG = "latest"
    }
    tools {
        maven 'Maven3'    // Nombre EXACTO configurado en Jenkins -> Global Tool Configuration
        jdk 'Java21'      // O el que hayas configurado (ej: Java17)
    }

    stages {
        stage('Checkout') {
     steps {
                git branch: 'main', url: 'https://github.com/ksimaliza/eureka.git', credentialsId: 'github-credentials'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKERHUB_REPO}:${IMAGE_TAG}")
                }
            }
        }

       stage('Run Docker Container') {
            steps {
                script {
                    echo "Corriendo contenedor..."
                    def app = docker.image("${DOCKERHUB_REPO}:${IMAGE_TAG}")
                    app.run('-d -p 8080:8080')  // -d: detached, -p: mapea puertos
                }
            }
        }

       stage('Login Docker Hub & Push') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS) {
                        docker.image("${DOCKERHUB_REPO}:${IMAGE_TAG}").push()
                    }
                }
            }
        }
    }
}
