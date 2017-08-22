docker build -t gitversion-json .

docker run --rm -v "${PWD}:/repo" -v "${PWD}/output:/out" gitversion-json
