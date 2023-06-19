# flask-app

- This is a simple python-flask application.
- src/app.py contains the all the main logic of application.
- requirements.txt will install all the dependancies for this application
- Dockerfile will create a docker image of this application
# jenkins job
  - on another EC2 instance i installed jenkins 
  - one jenkins job created which will execute following shell commands
    
# install application dependancies.
          pip install -r requirements.txt
          
          #docker build -t koko-flask .
          #docker push public.ecr.aws/y8s2m5c0/koko-flask:latest
# Set environment variables
          export ECR_REGISTRY=025946944436.dkr.ecr.ap-south-1.amazonaws.com/koko
          #public.ecr.aws/y8s2m5c0/koko-flask
          export TAG=latest
# Build the Docker image
          docker build -t $ECR_REGISTRY:$TAG .
# Login to ECR
          #aws ecr get-login --region 'ap-south-1' --no-include-email | sed 's|https://||'
          aws ecr get-login-password --region 'ap-south-1' | docker login --username AWS --password-stdin $ECR_REGISTRY
# Push the Docker image
          docker push $ECR_REGISTRY:$TAG
          
One webhook added in this repository.
jenkins job will be executed when we push code in this repository.
