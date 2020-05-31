docker build -t saschascata/multi-frontend:latest -t saschascata/multi-frontend:$SHA -f ./frontend/Dockerfile ./frontend
docker build -t saschascata/multi-backend:latest -t saschascata/multi-backend:$SHA -f ./backend/Dockerfile ./backend

docker push saschascata/multi-frontend:latest
docker push saschascata/multi-backend:latest

docker push saschascata/multi-frontend:$SHA
docker push saschascata/multi-backend:$SHA

kubectl apply -f k8s
kubectl set image deployments/backend-deployment backend=saschascata/multi-backend:$SHA
kubectl set image deployments/frontend-deployment frontend=saschascata/multi-frontend:$SHA