from fastapi import FastAPI
from fastapi.responses import HTMLResponse
import uvicorn

app = FastAPI()

@app.get("/", response_class=HTMLResponse)
async def read_root():
    with open("form.html", "r") as file:
        return file.read()

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=80)
