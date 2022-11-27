FROM jupyter/minimal-notebook:python-3.10

WORKDIR /content/

COPY ./requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

COPY --chown=jovyan:1000 ./src/ ./src/

EXPOSE 8888

ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--allow-root", "--NotebookApp.token=''"]
