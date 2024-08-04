from fastapi import FastAPI
from transformers import pipeline 

##create a new fastapi instance 
app = FastAPI()

#initilize the pipeline 
pipe = pipeline("text2text-generation",model="google/flan-t5-small") 

@app.get("/")
def home():
    return {"message":"Hello World"}


@app.get("/generate")
def generate(text:str):
    ##use the pipline to generate text from the given text input 
    output=pipe(text)

    ##return the genrated text in json response 
    return {"output" : output[0]['generated_text']}
 