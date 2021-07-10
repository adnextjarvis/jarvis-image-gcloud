# jarvis-image-gcloud
This repository will be used for manage nginx base image with required JARVIS configurations. <br>
Below are the software stack & version for container -
- Baseimage (gcloud)       :   325.0.0-alpine
- other
  - kubectl                :   1.17.1
  - helm                   :   3.4.1
  - jq                     :   3.2.1

<br><br>

### Build & Tag Details ::
| SL No | Container Name | Tag |
| :---: | :---: | :---: |
| 1 | jarvis-gcloud | v1.0.0 |


<br><br>

### Login to Docker hub
- Login to https://hub.docker.com
```
# Login with username & password details
   docker login --username adnextjarvis --password <password>

# Login with username & password-stdin
  cat ../adnextjarvis_pwd.txt | docker login --username adnextjarvis --password-stdin
```
- BUILD required Docker image
```
# Build docker image
  docker build . -t adnextjarvis/jarvis-gcloud:v1.0.0
```
- PUSH Docker image
```
# Push docker image to DTR repo
  docker push adnextjarvis/jarvis-gcloud:v1.0.0
```
