
FLAGS := -vrlxzich --safe-links --stats --del
LOCAL := public/
REMOTE := nat@seagull.ccs.neu.edu:~/www/ntuck-neu

all:
	rm -rf public
	zola build

ship: all
	rsync $(FLAGS) $(LOCAL) $(REMOTE)
