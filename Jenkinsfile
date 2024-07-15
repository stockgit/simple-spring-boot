pipeline {
    agent any
    tools{
            maven 'maven-3.5.2'
    }
    stages {
        stage('Pull From Git') {
            steps {
                git branch: 'jenkin_window_docker', changelog: false, poll: false, url: 'https://github.com/stockgit/satib.git'
            }
        }
        stage('Build') {
            steps {
                // Build your Spring Boot application using Maven
                echo 'Building with Maven'
                //sh 'mvn clean install'
                bat 'mvn clean install'
            }
        }
        stage('Docker Compose') {
            steps {
                //sh 'docker-compose up --build -d'
                bat 'docker-compose up --build -d'
            }
        }
        stage('Success') {
            steps {
                echo 'Deploy Successfully'
            }
        }
    }
}