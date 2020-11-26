def update = 'update.sh'
pipeline {
    agent { label 'master' }
    stages {
        stage("prepare test") {
            steps {
                sh "echo execute ${update} ..."
                timeout(time: 3, unit: 'MINUTES') {
                    retry(5) {
                        //call external shell script
                        sh "${update}"
                    }
                }
            }
        }
    }
}