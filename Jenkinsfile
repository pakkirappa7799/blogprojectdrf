#!groovy

node {
    try {
        stage 'Checkout'
        checkout scm

        sh 'git log HEAD..HEAD --pretty="%h %an - %s" > GIT_CHANGES'
        def lastChanges = readFile('GIT_CHANGES')

        def slackUrl = 'https://jenkins-django.slack.com/services/hooks/jenkins-ci'
        def encodedUrl = URLEncoder.encode(slackUrl, 'UTF-8')
        
        slackSend(url: "${encodedUrl}?token=jenkins-plugin-cli%20--plugins%20git:5.2.1", color: "warning", message: "Started `${env.JOB_NAME}#${env.BUILD_NUMBER}`\n\n_The changes:_\n${lastChanges}")

        stage 'Deploy'
        sh './deployment/deploy_prod.sh'

        stage 'Publish results'
        slackSend(color: "good", message: "Build successful: `${env.JOB_NAME}#${env.BUILD_NUMBER}` <${env.BUILD_URL}|Open in Jenkins>")
    } catch (err) {
        slackSend(color: "danger", message: "Build failed :face_with_head_bandage: \n`${env.JOB_NAME}#${env.BUILD_NUMBER}` <${env.BUILD_URL}|Open in Jenkins>")
        throw err
    }
}

