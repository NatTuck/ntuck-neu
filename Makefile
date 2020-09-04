
FLAGS := -vrlxzich --safe-links --stats --del
LOCAL := public/
REMOTE := nat@seagull.ccs.neu.edu:~/www/ntuck-neu

all:
	rm -rf public
	zola build

serve:
	zola serve

s: serve

ship: all
	rsync $(FLAGS) $(LOCAL) $(REMOTE)

.PHONY: all server s ship
