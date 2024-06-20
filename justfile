dev:
    hugo mod tidy
    hugo server --logLevel debug --disableFastRender

build:
    hugo --gc --minify