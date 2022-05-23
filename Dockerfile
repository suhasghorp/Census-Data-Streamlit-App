FROM python:3.8
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt

RUN python setup.py build_ext --inplace

EXPOSE 80
RUN mkdir ~/.streamlit
RUN cp config.toml ~/.streamlit/config.toml
RUN cp credentials.toml ~/.streamlit/credentials.toml
WORKDIR /app
ENTRYPOINT ["streamlit", "run"]
CMD ["census_app.py"]