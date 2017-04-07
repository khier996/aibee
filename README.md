Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

## Export production DB

```bash
pg_dump -d aibee_production -f aibee_prod_db.psql
```

## Import production DB

```
scp aibee@aibee.shanghaiwogeng.com:aibee_prod_db.psql .
sed -i -- 's/OWNER\ TO\ aibee;/OWNER\ TO\ guochunzhong;/g' aibee_prod_db.psql
psql -d postgres
DROP DATABASE aibee_development;
CREATE DATABASE aibee_development WITH ENCODING='UTF8' OWNER='guochunzhong';
\q
psql -d aibee_development -f aibee_prod_db.psql
```