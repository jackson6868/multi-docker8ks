docker build -t jackson3232/multi-client:latest -t jackson3232/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jackson3232/multi-server:latest -t jackson3232/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jackson3232/multi-worker:latest -t jackson3232/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push jackson3232/multi-client:latest
docker push jackson3232/multi-server:latest
docker push jackson3232/multi-worker:latest

docker push jackson3232/multi-client:$SHA
docker push jackson3232/multi-server:$SHA
docker push jackson3232/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=jackson3232/multi-server:$SHA
kubectl set image deployments/client-deployment client=jackson3232/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=jackson3232/multi-worker:$SHA