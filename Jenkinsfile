pipeline {
    agent { label 'master' }

    stages {
        stage('Docker version') {
            steps {
                sh "echo $USER"
                sh 'docker version'
            }
        }
        stage('Delete workspace before build starts') {
            steps {
                echo 'Deleting workspace'
                deleteDir()
            }
        }
        stage('Checkout') {
            steps{
                git branch: 'main',
                    url: 'https://github.com/01Yura/home_project.git'        
                }
        }
        stage('Test') {
            steps{
                sh "ls -la "
                sh "pwd"
            }
        }
        stage('Build docker image') {
            steps{
                sh 'docker build -t 01yura/jenkins-image:2.0.0 .'
            }
        }
        stage('Push docker image to DockerHub') {
            steps{
                withDockerRegistry(credentialsId: 'dockerhub-cred-yura', url: 'https://index.docker.io/v1/') {
                    sh '''
                        docker push 01yura/jenkins-image:2.0.0
                    '''
                }
            }
        }
        stage('Deploy to Test server') {
            steps {
                dir('k8s') {
                    sh 'kubectl --kubeconfig=/var/lib/jenkins/.kube/config_test_server apply -f deployment.yaml -f service_nodeport.yaml'
                }
            }
        }
        stage('Delete docker image locally') {
            steps{
                sh 'docker rmi 01yura/jenkins-image:2.0.0'
            }
        }
    }
}
