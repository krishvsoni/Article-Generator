from flask import Flask, render_template, request
from langchain.llms import OpenAI
from langchain.prompts import PromptTemplate
from langchain.chains import LLMChain

app = Flask(__name__)


@app.route('/')
def index():
    return render_template("index.html")


@app.route('/generate', methods=['GET', 'POST'])
def generate():
    if request.method == 'POST':
        prompt = PromptTemplate.from_template("Generate an article on title {title}? of two huge paragraph")
        llm = OpenAI(openai_api_key='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')
        chain = LLMChain(llm=llm, prompt=prompt)
        prompt = request.json.get('prompt')
        output = chain.run(prompt)
        return output

app.run(port=8000)

