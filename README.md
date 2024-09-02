# simple-spring-boot

### Deploy with jenkins pipeline

File : Jenkinsfile
```
pipeline {
    agent any

    tools{
        //jdk 'jdk17'
        maven 'maven-3.5.2'
    }

    stages {
        stage('Code Checkout') {
            steps {
                git branch: 'master', changelog: false, poll: false, url: 'https://github.com/stockgit/satib.git'
            }
        }
        stage('Unit Test') {
            steps {
                // Run your unit tests using Maven
                echo 'Running unit tests with Maven'
                //sh 'mvn clean test'
                bat 'mvn clean test'
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
        stage('Deploy') {
            steps {
                // Deploy your Spring Boot application to AWS
                //echo 'Deploying to Tomcat'
                //sh 'java -jar target/demo-0.0.1-SNAPSHOT.jar'
                //bat 'java -jar target/demo-0.0.1-SNAPSHOT.jar'

                echo "Killing the process"
                //sh 'sudo -nS kill -9 `sudo -nS lsof -t -i:8433` || true'
                echo 'start spring boot'
                bat 'start /min java -jar target/demo-0.0.1-SNAPSHOT.jar &'
            }

        }

        /*
        stage('OWASP Dependency Check'){
            steps{
                dependencyCheck additionalArguments: '--scan ./ --format HTML ', odcInstallation: 'db-check'
                dependencyCheckPublisher pattern: '**//* dependency-check-report.xml'
            }
        }

        stage('Sonarqube Analysis') {
            steps {
                sh ''' mvn sonar:sonar \
                    -Dsonar.host.url=http://localhost:9000/ \
                    -Dsonar.login=squ_9bd7c664e4941bd4e7670a88ed93d68af40b42a3 '''
            }
        }
        */

       /*
       stage('Clean & Package'){
            steps{
                sh "mvn clean package -DskipTests"
            }
        }
       stage('Clean & Package'){
           steps{
               //sh "mvn clean package -DskipTests"
               bat 'mvn clean package -DskipTests'
           }
       }
        stage("Tests") {
            steps("Running unit tests") {
              //sh "mvn test -Punit"
              bat 'mvn test -Punit'
            }
        }

        stage("Deployment") {
            steps("Deployment") {
              //sh 'nohup mvn spring-boot:run -Dserver.port=8001 &'
              //bat 'mvn spring-boot:run -Dserver.port=8001 &'
              bat 'nohup mvn spring-boot:run'
            }
        }
        stage('Clean & Package'){
            steps{
                //sh "mvn clean package -DskipTests"
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Clean & Deploy'){
            steps{
                //sh "mvn clean install -DskipTests"
                bat 'mvn clean install -DskipTests'
            }
        }
        */
       /*
       stage("Docker Build & Push"){
            steps{
                script{
                    withDockerRegistry(credentialsId: 'DockerHub-Token', toolName: 'docker') {
                        def imageName = "spring-boot-prof-management"
                        def buildTag = "${imageName}:${BUILD_NUMBER}"
                        def latestTag = "${imageName}:latest"  // Define latest tag

                        sh "docker build -t ${imageName} -f Dockerfile.final ."
                        sh "docker tag ${imageName} abdeod/${buildTag}"
                        sh "docker tag ${imageName} abdeod/${latestTag}"  // Tag with latest
                        sh "docker push abdeod/${buildTag}"
                        sh "docker push abdeod/${latestTag}"  // Push latest tag
                        env.BUILD_TAG = buildTag
                    }

                }
            }
        }

        stage('Vulnerability scanning'){
            steps{
                sh " trivy image abdeod/${buildTag}"
            }
        }

        stage("Staging"){
            steps{
                sh 'docker-compose up -d'
            }
        }

         */
    }
}
```
