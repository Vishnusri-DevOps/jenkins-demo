pipeline {
    agent any

    environment {
	 IMAGE = "yourdockerhubusername/jenkins-demo"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Vishnusri-DevOps/jenkins-demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE .'
            }
        }

        stage('Push to DockerHub') {
            steps {
               withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
    			sh 'echo $PASS | docker login -u $USER --password-stdin'
   			sh 'docker push $IMAGE'

            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker run -d -p 5000:5000 $IMAGE'
            }
        }
    }
}
