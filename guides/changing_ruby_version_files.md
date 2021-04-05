# Batch update `.ruby-version` files

```bash
ag --hidden -l [OLD-VERSION] ./**/.ruby-version | xargs -I FILE sed -i 's/.*/[NEW-VERSION]/g' FILE
