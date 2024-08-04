##use the official python 3.11.7 image 
FROM python:3.11

##set the working directory to/ code
WORKDIR /code

#copy the current directory contents in the container at /code
COPY ./requirements.txt /code.requirements.txt 

##install the requirements.txt 
RUN pip install --np0cache-dir --upgrade -r /code/reuirements.txt

#set io a new user nmaed 'user'
RUN useradd USER

#switch to the "user" user

#set home to the user's home directory

ENV HOME=/home/user \ 
    PATH=/home/user/.local/bin:$PATH

#set the working dirctory to the user home directory 
WORKDIR $HOME/app

#copy the current directory contents into the the container at $HOME/app setting the owner to 
COPY - -chown=user . $HOME/app

## start the fastapi APP ON PORT 8000
CMD ["uvicorn","app:app","--host","0.0.0.0","--port","8000"]


