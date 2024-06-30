# Use the appropriate base image
FROM ubuntu:latest

# Install dependecies
RUN apt-get update && apt-get install curl openssl git -y

# Set the working directory
WORKDIR /app

# Copy the application code
COPY ./wisecow.sh .

# Install dependencies
RUN apt-get update
RUN apt-get install fortunes fortune-mod cowsay netcat-openbsd coreutils -y
RUN chmod +x ./wisecow.sh

ENV PATH=$PATH:/usr/games

RUN useradd guest
RUN chown guest:guest /app
USER guest

# Command to run the application
ENTRYPOINT ["./wisecow.sh"]

