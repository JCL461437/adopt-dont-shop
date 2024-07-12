web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK-ENV:-development}
release: bundle.exec rails db:{drop,create,migrate,seed}
