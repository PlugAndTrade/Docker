# Jinja2 templating

Run j2 templates through a jinja2 container

## Running

To run `file.yaml.j2` in the current directory through `jinja2-cli` and output a `file.yaml` do:

```bash
docker run -v $(pwd)/file.yaml.j2:/file.j2 -i -a stdout -a stderr plugandtrade/jinja2 /file.yaml.j2 > file.yaml
```
