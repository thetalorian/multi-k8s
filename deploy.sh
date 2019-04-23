docker build -t thetalorian/md-client:latest -t thetalorian/md-client:$SHA -f ./client/Dockerfile ./client
docker build -t thetalorian/md-server:latest -t thetalorian/md-server:$SHA -f ./server/Dockerfile ./server
docker build -t thetalorian/md-worker:latest -t thetalorian/md-worker:$SHA -f ./worker/Dockerfile ./worker
docker push thetalorian/md-client:latest
docker push thetalorian/md-server:latest
docker push thetalorian/md-worker:latest
docker push thetalorian/md-client:$SHA
docker push thetalorian/md-server:$SHA
docker push thetalorian/md-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=thetalorian/md-client:$SHA
kubectl set image deployments/server-deployment server=thetalorian/md-server:$SHA
kubectl set image deployments/worker-deployment worker=thetalorian/md-worker:$SHA