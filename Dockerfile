FROM python:3.9

LABEL auteur="adrien"
LABEL type="dev"

# équivalent de : mkdir application puis d'un cd application
WORKDIR /application

COPY ./requirements.txt .
COPY ./src .

RUN pip install -r requirements.txt

# ENTRYPOINT [ ]
CMD [ "python3" , "app.py" ]
