pipeline {
    agent any

    stages {
        stage('Pull Code From GitHub') {
            steps {
                git 'https://github.com/Alvinbsi/alvinproject.git'
            }
        }
        stage('Build the Docker image') {
            steps {
                sh 'sudo docker build -t alvinimage /var/lib/jenkins/workspace/alvinproj'
                sh 'sudo docker tag alvinimage alvinselva/alvinimage:latest'
                sh 'sudo docker tag alvinimage alvinselva/alvinimage:${BUILD_NUMBER}'
            }
        }
        stage('Push the Docker image') {
            steps {
                sh 'sudo docker image push alvinselva/alvinimage:latest'
                sh 'sudo docker image push alvinselva/alvinimage:${BUILD_NUMBER}'
            }
        }
        stage('Deploy on Kubernetes') {
            steps {
                sh 'sudo kubectl apply -f /var/lib/jenkins/workspace/alvinproj/pod.yaml'
                sh 'sudo kubectl rollout restart deployment loadbalancer-pod'
            }
        }
    }
}
