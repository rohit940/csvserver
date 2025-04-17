# CSV Server Container Task

This project demonstrates how to run the `infracloudio/csvserver:latest` Docker container using a custom input file and environment configuration.

---

## Step 1: Run and Debug the Container

Start the container:

```bash
docker run -d --name csvserver infracloudio/csvserver:latest
```

### Check if it's running:

```bash
docker ps -a
```

### If it's failing, inspect the logs:

```bash
docker logs csvserver
```

### Reason for failure:
The container expects a file named `inputFile` mounted at `/csvserver/inputdata/inputFile`.

---

## Step 2: Generate the Input File

Use the existing script:

```bash
./gencsv.sh 2 8
```

This generates an `inputFile` with 7 lines of comma-separated values starting from index 2 to 8.

---

## Step 3: Run Container with Mounted Input File

```bash
docker run -d --name csvserver \
  -v "$PWD/inputFile":/csvserver/inputdata \
  infracloudio/csvserver:latest
```

---

## Step 4: Check Listening Port

### Access the container shell:

```bash
docker exec -it csvserver sh
```

### Find the listening port:

```bash
netstat -tuln
```

The application listens on port `9300`.

### Exit and clean up:

```bash
docker stop csvserver
docker rm csvserver
```

---

## Step 5: Final Run with Port Mapping and Environment Variable

```bash
docker run -d --name csvserver \
  -v "$PWD/inputFile":/csvserver/inputdata \
  -e CSVSERVER_BORDER=Orange \
  -p 9393:9300 \
  infracloudio/csvserver:latest
```

### Open your browser and visit:

http://localhost:9393

You should see the data from `inputFile` and a welcome note with an **orange** border.

---

### Cleanup

To stop and remove the container:

```bash
docker stop csvserver
docker rm csvserver
```

## Step 6: Create docker-compose.yaml and csvserver.env for Docker Compose Setup

To run the container using Docker Compose in the background, run below command:
```bash
docker-compose up -d
```
To stop the container run -
```bash
docker-compose down
```