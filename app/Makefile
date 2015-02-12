compile:
	npm install
	coffee --map --output bin --compile ./app.coffee
	browserify bin/app.js -o bin/bundle.js
	cp index.html bin/index.html

serve:
	node ./node_modules/http-server/bin/http-server -o -p 3000 -d ./bin/

clean:
	rm -rf bin/*
