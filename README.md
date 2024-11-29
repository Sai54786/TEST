# TEST

1. Tools Required:
   - Terraform
   - Docker
   - Kubernetes CLI (kubectl)
   - Helm
2. Cloud Requirements:
   - AWS Account with permissions to create EKS clusters.

## Steps to Deploy

# Step 1: Provision Cloud Infrastructure
1. Navigate to the `terraform` directory:
   ```bash
   cd terraform
   terraform init
   terraform apply

# Step 2: Deploy Web Application
1. Build and push the Docker image:

docker build -t static-web-app .
docker tag static-web-app:latest <registry>/static-web-app:latest
docker push <registry>/static-web-app:latest

2. Apply Kubernetes YAMLs:

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

# Step 3: Set Up Monitoring

1.Install Prometheus using Helm:
helm install prometheus prometheus-community/kube-prometheus-stack

2.Access Prometheus:
kubectl port-forward svc/prometheus-kube-prometheus-prometheus 9090:9090

# Verification

Access Application
Find the Load Balancer IP:

kubectl get svc static-web-app
Visit http://<load-balancer-ip> in your browser.

Access Prometheus:
Visit http://localhost:9090 after port-forwarding.
