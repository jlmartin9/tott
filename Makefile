.PHONY: clean doc watch-doc watch-slides

export AUDIO_ROOT=http://static.mindtrove.info/tott/audio
export VIDEO_ROOT=http://static.mindtrove.info/tott/video

build:
	@git submodule update --init
	@cd doc/slides; npm install

all: slides doc

clean:
	@make -C doc clean

doc:
	@make -C doc clean html

watch-doc:
	@wr "make -C doc clean html" doc/*.rst doc/sessions/*.rst doc/conf.py

slides:
	@cd doc/slides; npm run-script build

watch-slides:
	@cd doc/slides; npm run-script watch
