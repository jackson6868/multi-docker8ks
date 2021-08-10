docker build -t jackson/multi-client:latest -t jackson/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jackson/multi-server:latest -t jackson/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jackson/multi-worker:latest -t jackson/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push jackson3232/multi-client:latest
docker push jackson3232/multi-server:latest
docker push jackson3232/multi-worker:latest

docker push jackson3232/multi-client:$SHA
docker push jackson3232/multi-server:$SHA
docker push jackson3232/multi-worker:$SHA
kubect apply -f k8s
kubect set image deployments/server-deployment server=jackson3232/multi-server:$SHA
kubect set image deployments/client-deployment client=jackson3232/multi-client:$SHA
kubect set image deployments/worker-deployment worker=jackson3232/multi-worker:$SHA