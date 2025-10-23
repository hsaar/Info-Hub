import pymysql
from elasticsearch import Elasticsearch, helpers
from tqdm import tqdm

# -----------------------------
# MySQL 연결
# -----------------------------
mysql_conn = pymysql.connect(
    host="mbc-sw.iptime.org",
    port=4200,
    user="infohub",
    password="dlsvhgjqm123",
    database="infohub",
    charset="utf8mb4"
)
cursor = mysql_conn.cursor(pymysql.cursors.DictCursor)

# -----------------------------
# Elasticsearch 연결
# -----------------------------
es = Elasticsearch(
    ["http://192.168.0.16:9200"],
    verify_certs=False
)

# -----------------------------
# 기존 인덱스 삭제 및 생성
# -----------------------------
index_name = "news_index"
if es.indices.exists(index=index_name):
    es.indices.delete(index=index_name)

es.indices.create(
    index=index_name,
    mappings={
        "properties": {
            "articleId": {"type": "integer"},
            "title": {"type": "text"},
            "content": {"type": "text"},
            "tags": {"type": "text"},
            "published": {"type": "date"},
            "source": {"type": "keyword"},
            "views": {"type": "integer"},
            "hearts": {"type": "integer"},
            "image": {"type": "keyword"},
            "link": {"type": "keyword"},
            "articlecategories_categoriesNo": {"type": "integer"},
            "keyword": {"type": "text"}
        }
    }
)

# -----------------------------
# MySQL 데이터 조회
# -----------------------------
cursor.execute("""
    SELECT articleId, title, content, tags, published, source, views, hearts, image, link, articlecategories_categoriesNo, keyword
    FROM news
""")
rows = cursor.fetchall()

# -----------------------------
# Bulk 업로드
# -----------------------------
actions = [
    {
        "_index": index_name,
        "_id": row["articleId"],
        "_source": row
    }
    for row in rows
]

helpers.bulk(es, actions)
print(f"✅ 총 {len(rows)}개의 뉴스 데이터 업로드 완료")

# -----------------------------
# 연결 종료
# -----------------------------
cursor.close()
mysql_conn.close()
