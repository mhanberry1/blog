#!/bin/bash

set -e

ROOT=$PWD

function markdown(){
	perl $ROOT/Markdown_1.0.1/Markdown.pl --html4tags $1
}

function build_posts(){
	cd $ROOT/posts

	for FILE in `ls *.md`; do
		HTML_FILE="${FILE/.md/.html}"

		cat header.html > $HTML_FILE
		markdown $FILE >> $HTML_FILE
		cat footer.html >> $HTML_FILE
	done

	cd $ROOT
}

function build_recent_posts_list(){
	LEAD='		<!--begin recent posts-->'
	TAIL='		<!--end recent posts-->'

	markdown posts/index.md | head > temp.html

	sed -i -e "/$LEAD/,/$TAIL/{ /$LEAD/{p; r temp.html
        }; /$TAIL/p; d }" index.html
	
	rm temp.html
}

# Main
build_posts
build_recent_posts_list
