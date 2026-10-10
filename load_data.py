import os
import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.engine import URL

url = URL.create(
    "postgresql+psycopg2",
    username="postgres",
    password=os.environ["PGPASSWORD"],
    host="localhost",
    port=5432,
    database="cookie_cats",
)
engine = create_engine(url, connect_args={"options": "-c lc_messages=C"})

files = {
    "players": "cookie_cats.csv",
}

for table, filename in files.items():
    df = pd.read_csv(f"data/{filename}")
    df.to_sql(table, engine, if_exists="replace", index=False)
    print(f"{table}: {len(df)} строк загружено")