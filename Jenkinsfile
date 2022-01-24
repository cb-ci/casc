pipeline {
    agent any

    stages {
        stage('Update Casc Bundles') {
            steps {
                echo "Update casc ...."
                timeout(time: 3, unit: 'MINUTES') {
                    retry(5) {
                        sh "ls -l"
                        sh "./update.sh"
                    }
                }

            }
        }
    }
}