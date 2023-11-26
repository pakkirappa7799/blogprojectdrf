node {
    try {
        stage 'Checkout'
        checkout scm

        sh 'git log HEAD..HEAD --pretty="%h %an - %s" > GIT_CHANGES'
        def lastChanges = readFile('GIT_CHANGES')

        stage 'Deploy'
        sh './deployment/deploy_prod.sh'

        stage 'Publish results'
        echo "Build successful: ${env.JOB_NAME}#${env.BUILD_NUMBER} - Open in Jenkins: ${env.BUILD_URL}"
    } catch (err) {
        echo "Build failed :face_with_head_bandage: ${env.JOB_NAME}#${env.BUILD_NUMBER} - Open in Jenkins: ${env.BUILD_URL}"
        throw err
    }
}
