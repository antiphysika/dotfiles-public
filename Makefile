SHELL = /bin/bash

DOTFILES =            \
  .bash_logout        \
  .bash_profile       \
  .bashrc             \
  .bashrc_aliases     \
  .bashrc_completion  \
  .bashrc_environment \
  .bashrc_functions   \
  .bashrc_history     \
  .bashrc_keychain    \
  .bashrc_shopt       \
  .bashrc_prompt      \
  .profile            \
  .screenrc           \
  .toprc              \
  .vim                \
  .vimrc              \


ifeq ($(origin HOME), undefined)
  $(error environment variable HOME not set)
endif

.PHONY: all
all: init-submodules install-symlinks

.PHONY: init-submodules
init-submodules:
	git -C $(HOME)/.dotfiles submodule update --init --recursive

.PHONY: install-symlinks
install-symlinks:
	@cd '$(HOME)';\
	files='$(addprefix .dotfiles/,$(DOTFILES))';\
	for file in $$files;\
	do\
	  echo rm -f $$(basename $$file);\
	  rm -f $$(basename $$file);\
	  echo ln -sfn $$file;\
	  ln -sfn $$file;\
	done

##
# vim: ts=8 sw=8 noet fdm=marker :
##
