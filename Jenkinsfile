pipeline
{
agent any
stages 

{ stage ('scm_checkout')
  { steps { git branch: 'master', url: 'https://github.com/NED-REI/DevOpsProfessional' } }

  stage ('docker build and push')
  {steps { withDockerRegistry(credentialsId: 'dockerHubAccount', url: 'https://index.docker.io/v1/') 
          {  sh 'docker build -t pkw0301/intellipaat:latest .'
             sh 'docker push pkw0301/intellipaat:latest'}  
         } }

 stage ('deploy to kubernetes')
 {steps { withAWS(credentials: 'awsaccount', region: 'eu-central-1') 
   { sh 'aws eks --region eu-central-1 update-kubeconfig --name k8s-eks'
     sh  'kubectl apply -f k8s-manifest.yaml'
   } }
 }

  

}}
