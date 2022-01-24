pipeline {
    agent any

    stages {
        stage('Update Casc Bundles') {
            steps {
                echo "Update casc ...."
                sh "./update.sh"
            }
        }
    }
}