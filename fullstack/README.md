# - Despliegue
```bash
npm start # frontend
python3 manage.py runserver # backend
```

# - Referencia
- https://es.reactjs.org/
- https://react-bootstrap.github.io/


# - Formato universal de comunicacion back-front
```json
{
    "info":"estado de la transaccion",
    "datos":{
        "entrada":{
            "dato_1":"dato_1",
            "dato_2":"dato_2",
            "dato_3":"dato_3"
        },
        "salida":{
            "dato_1":"dato_1",
            "dato_2":"dato_2",
            "dato_3":"dato_3"
        },
        "control":{
            "dato_1":"dato_1",
            "dato_2":"dato_2",
            "dato_3":"dato_3"
        }
    }
}
```