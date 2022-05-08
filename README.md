# CAR SELLER

Aplikacja do sprzedaży samochodów.

- [CAR SELLER](#car-seller)
  - [Wykorzystane technologie](#wykorzystane-technologie)
  - [Instalacja](#instalacja)
  - [Uruchomienie](#uruchomienie)
  - [Struktura projektu](#struktura-projektu)

## Wykorzystane technologie

- FastAPI - framework aplikacji webowych dla Pythona | [strona projektu](https://fastapi.tiangolo.com/)
- SQLAlchemy - ORM dla Pythona | [strona projektu](https://www.sqlalchemy.org/)
- SQLite - system zarządzania relacyjną bazą danych SQL; baza nie wymaga konfiguracji serwera, ponieważ jej zawartość jest przechowywana w jednym pliku | [strona projektu](https://www.sqlite.org/)
- Jinja2 - język szabloów | [strona projektu](https://jinja.palletsprojects.com/)

## Instalacja 

Instalacja środowiska przy użyciu powershella.
```powershell 
python3 -m venv venv
get-service -flag value
```

*Ważne:* wirtualne srodowisko przestanie dzialac jezeli przekopiujemy projekt w inne miejsce. W takiej sytuacji nalezy skaoswac folder `venv` i utowrzyc srodowisko na nowo.

## Uruchomienie  


```powershell
uvicorn car_seller.main:app --reload
```

Flaga `--reload` sprawi, ze aplikacja zostanie przeladowana kiedy tylko zostana wykryte zmiany w plikach projektu.

Aplikacja domyślnie zostanie uruchomiona na porcie :8000. Możemy teraz wejść na adres: http://localhost:8000/

http://localhost:8000/


*Uwaga*: Jeżeli potrzebujemy uruchomić aplikację na innym porcie niż domyślny, możemy uruchomić serwer z dodatkową flagą `--port`,
np. aby wystawić aplikację na porcie *8123* podajemy:

```powershell
uvicorn car_seller.main:app --reload --port 8123
```


```python
[x for x in range(100) if x % 2]
```

## Struktura projektu

```

projekt
│
│   README.md              <- ten plik
│   file001.txt    
│
└───folder1
│   │   __init__.py        <- pozwala importować pliki z tego folderu
│   │   file011.py
│   │   file012.py
│   │   (...)
│   │
│   └───subfolder1
│       │   file111.py
│       │   file112.py
│       │   (...)
│   
└───folder2
    │   file021.py
    │   file022.py
  (...)

```