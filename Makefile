ROOT=$(shell pwd)
METEOR_VERSION=v0.5.9

# Global Tasks
###
clean: clean/locomotive.js \
		clean/socketstream \
		clean/compound.js \
		clean/sails.js
	-rm -rf node_modules
	-npm cache clean

# Node.js
###
node.js: .PHONY
	node node.js

clean/node.js:
	@echo "no clean actions required"

# CompoundJS
###
compound.js: node_modules/compound compound.js/node_modules .PHONY
	cd compound.js; node server.js

node_modules/compound:
	npm install compound

compound.js/node_modules:
	cd compound.js; npm install

clean/compound.js:
	-rm -rf node_modules/compound
	-rm -rf node_modules/.bin/compound
	-rm -rf compound.js/node_modules

# Connect
###
connect: node_modules/connect .PHONY
	node connect

node_modules/connect:
	npm install connect

clean/connect: .PHONY
	-rm -rf node_modules/connect

# Express
###
express: node_modules/express .PHONY
	node express

node_modules/express:
	npm install express

clean/express: .PHONY
	-rm -rf node_modules/express
	-rm node_modules/.bin/express

# Flatiron
###
flatiron: node_modules/flatiron node_modules/union .PHONY
	node flatiron

node_modules/flatiron:
	npm install flatiron

node_modules/union:
	npm install union

clean/flatiron: .PHONY
	-rm -rf node_modules/flatiron
	-rm -rf node_modules/union
	-rm node_modules/.bin/flatiron

# Geddy
###
geddy.js: node_modules/.bin/geddy .PHONY
	cd geddy.js; ../node_modules/.bin/geddy

node_modules/.bin/geddy:
	npm install geddy

clean/geddy: .PHONY
	-rm node_modules/.bin/geddy
	-rm -rf node_modules/geddy

# Hapi
###
hapi: node_modules/hapi .PHONY
	node hapi

node_modules/hapi:
	npm install hapi

clean/hapi:
	-rm -rf node_modules/hapi
	-rm -rf node_modules/.bin/hapi

# Locomotive
###
locomotive.js: node_modules/.bin/lcm locomotive.js/node_modules .PHONY
	cd locomotive.js; ./node_modules/.bin/lcm server

node_modules/.bin/lcm:
	npm install locomotive

locomotive.js/node_modules:
	cd locomotive.js; npm install

clean/locomotive.js: .PHONY
	-rm -rf node_modules/locomotive
	-rm -rf node_modules/.bin/lcm
	-rm -rf locomotive.js/node_modules

# Meteor
###
meteor.js: node_modules/meteor .PHONY
	cd meteor.js; ../node_modules/meteor/meteor

node_modules/meteor:
	-mkdir -p node_modules
	git clone https://github.com/meteor/meteor.git node_modules/meteor
	cd node_modules/meteor && git checkout -b $(METEOR_VERSION) $(METEOR_VERSION)

clean/meteor:
	-rm -rf node_modules/meteor


# Ni
###
ni: node_modules/ni node_modules/connect .PHONY
	node ni

node_modules/ni:
	npm install "git+https://github.com/chetan51/ni.git#master"

clean/ni: clean/connect
	-rm -rf node_modules/ni
	-rm -rf node_modules/.bin/ni

# Nombo
###
nombo: node_modules/.bin/nombo node_modules/socketcluster-server .PHONY
	node nombo/server.node 3000

node_modules/.bin/nombo:
	npm install nombo

# hack to ensure nombo modules are installed correctly
node_modules/socketcluster-server:
	./node_modules/.bin/nombo create --force nombo

clean/nombo: .PHONY
	@echo "Nombo messes up node_modules but good, 'make clean' should be run removing all modules to ensure nombo is cleaned."

# partial.js
###
partial.js: node_modules/partial.js .PHONY
	cd partial.js; node index.js

node_modules/partial.js:
	npm install partial.js

clean/partial.js: .PHONY
	-rm -rf node_modules/partial.js
	-rm -rf node_modules/.bin/partial.js

# Restify
###
restify: node_modules/restify .PHONY
	node restify

node_modules/restify:
	npm install restify

clean/restify:
	-rm -rf node_modules/restify
	-rm -rf node_modules/.bin/restify-latency

# Sails
###
sails.js: node_modules/sails sails.js/node_modules .PHONY
	cd sails.js; node ../node_modules/.bin/sails lift

node_modules/sails:
	-npm install sails

sails.js/node_modules:
	cd sails.js; npm install

clean/sails.js:
	-rm -rf node_modules/sails
	-rm -rf node_modules/.bin/sails
	-rm -rf sails.js/node_modules

# Socket.IO
###
socket.io: node_modules/socket.io .PHONY
	node socket.io

node_modules/socket.io:
	npm install socket.io

clean/socket.io:
	-rm -rf node_modules/socket.io

# SocketStream
###
socketstream: node_modules/socketstream socketstream/node_modules .PHONY
	cd socketstream; node app.js

socketstream/node_modules:
	cd socketstream; npm install

node_modules/socketstream:
	npm install socketstream

clean/socketstream: .PHONY
	-rm -rf node_modules/socketstream
	-rm -rf node_modules/.bin/socketstream
	-rm -rf socketstream/node_modules

# Spine
###
spine: .PHONY
	node spine

clean/spine:
	@echo "no clean actions required"

# Stapes
###
stapes: .PHONY
	node stapes

clean/stapes:
	@echo "no clean actions required"

# TotalJS
###
total.js: node_modules/total.js .PHONY
	node total.js

node_modules/total.js:
	npm install total.js

clean/total.js:
	-rm -rf node_modules/total.js
	-rm -rf node_modules/.bin/total

# WebJS
###
webjs: node_modules/webjs .PHONY
	node webjs

node_modules/webjs:
	npm install webjs

clean/webjs:
	-rm -rf node_modules/webjs
	-rm -rf node_modules/.bin/webjs

# Koa
###
koa: .PHONY
	# Sample code exists but is disabled as it's un-tested at this time due to it's node >=0.11 requirement.

# Tower
###
tower: .PHONY
	# Sample code exists but is disabled as it's un-tested at this time due to it's node >=0.11 requirement.

.PHONY:

# Test Stuff
###
FRAMEWORK_TESTS=$(shell find ./test -name *_test.sh)
test: test/shunt.sh .PHONY
	@make clean > /dev/null
	@./test/shunt.sh --verbose $(FRAMEWORK_TESTS)

test/shunt.sh:
	cd test && curl -sL https://raw.github.com/odb/shunt/master/install.sh | bash -s master local

test/%: test/shunt.sh .PHONY
	@make clean > /dev/null
	./test/shunt.sh --verbose ./$@

# vim: set ft=make ai sw=4 sts=4 ts=4 noexpandtab:
