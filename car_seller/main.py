from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates


app = FastAPI()


app.mount("/static", StaticFiles(directory="car_seller/static"), name="static")

templates = Jinja2Templates(directory="car_seller/templates")


# @app.get("/")
# async def root():
#     return {"message": "Hello World"}

@app.get("/", response_class=HTMLResponse)
async def read_item(request: Request):
    return templates.TemplateResponse("landing-page.html", {"request": request})


@app.get("/value/{id}")
async def read_item():
    return {"one": "two threes"}


@app.get("/items/{id}", response_class=HTMLResponse)
async def read_item(request: Request, id: str):
    return templates.TemplateResponse("item.html", {"request": request, "id": id})


@app.get("/cars", response_class=HTMLResponse)
async def read_item(request: Request):
    return templates.TemplateResponse("cars.html", {"request": request})